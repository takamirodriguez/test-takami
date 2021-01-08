<?php

namespace App\Http\Controllers\API;

use JWTAuth;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Response;

class UserController extends Controller
{
    public $token = true;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //Show user list by 15 result per page
        $users = User::paginate(15); //Pagination items number can be send as paramater if needed
        return response()->json($users, 200);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Create new user

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'username' => 'required|string|max:255|unique:users',
            'date_of_birth' => 'date',
            'phone' => 'required|numeric',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'c_password' => 'required|same:password'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $user = User::create([
            'name' => $request->get('name'),
            'username' => $request->get('username'),
            'date_of_birth' => $request->get('date_of_birth'),
            'phone' => $request->get('phone'),
            'email' => $request->get('email'),
            'password' => Hash::make($request->get('password')),
        ]);

        if ($this->token) {
            return $this->login($request);
        }

        return response()->json([
            'success' => true,
            'data' => $user
        ], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $user =  User::find($id);
        return response()->json($user, 200);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $validator = Validator::make($request->all(), [
            'name' => 'string|max:255',
            'username' => 'string|max:255|unique:users',
            'date_of_birth' => 'date',
            'phone' => 'numeric',
            'email' => 'string|email|max:255|unique:users',
            'password' => 'string|min:6'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator);
        }

        if (User::where('id', $id)->exists()) {
        $user =  User::find($id);
        $user->name = is_null($request->get('name')) ? $user->name : $request->get('name');
        $user->username = is_null($request->get('username')) ? $user->username : $request->get('username');
        $user->email = is_null($request->get('email')) ? $user->email : $request->get('email');
        $user->phone = is_null($request->get('phone')) ? $user->phone : $request->get('phone');
        $user->date_of_birth = is_null($request->get('date_of_birth')) ? $user->date_of_birth : $request->get('date_of_birth');
        if(!is_null($request->get('password'))){
            $user->password = Hash::make($request->get('password'));
        }

        $user->save();

            return response()->json([
                "message" => "records updated successfully"
            ], 200);
        } else {
            return response()->json([
                "message" => "User not found"
            ], 404);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $user = User::destroy($id);
        return response()->json([
            "message" => "record removed successfully"
        ], 200);

    }

    public function login(Request $request)
    {
        $input = $request->only('email', 'password');
        $jwt_token = null;

        if (!$jwt_token = JWTAuth::attempt($input)) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid Email or Password',
            ], Response::HTTP_UNAUTHORIZED);
        }

        return response()->json([
            'success' => true,
            'token' => $jwt_token,
        ]);
    }


    public function logout(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);

        try {
            JWTAuth::invalidate($request->token);

            return response()->json([
                'success' => true,
                'message' => 'User logged out successfully'
            ]);
        } catch (JWTException $exception) {
            return response()->json([
                'success' => false,
                'message' => 'Sorry, the user cannot be logged out'
            ], Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function getUser(Request $request)
    {
        $this->validate($request, [
            'token' => 'required'
        ]);

        $user = JWTAuth::authenticate($request->token);

        return response()->json(['user' => $user]);
    }

}
