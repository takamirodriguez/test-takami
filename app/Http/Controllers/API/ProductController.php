<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Response;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $products = Product::paginate(2);
        return response()->json($products, 200);

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255|unique:products',
            'SKU' => 'required|string|max:255|unique:products',
            'quantity' => 'required|numeric',
            'price' => 'numeric',
            'description' => 'string|max:255',
            'file' => 'mimes:jpeg,png,jpg,gif,svg|max:4096'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        $fileName = time().'_'.$request->file->getClientOriginalName();
        $filePath = $request->file('file')->storeAs('/', $fileName, 'public');

        $image_url = '/storage/' . $filePath;


        $product = Product::create([
            'name' => $request->get('name'),
            'SKU' => $request->get('SKU'),
            'quantity' => $request->get('quantity'),
            'price' => $request->get('price'),
            'description' => $request->get('description'),
            'image_url' => $image_url
        ]);

        return response()->json([
            'success' => true,
            'data' => $product
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
        $product =  Product::find($id);
        return response()->json($product, 200);
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
            'name' => 'required|string|max:255|unique:products',
            'SKU' => 'required|string|max:255|unique:products',
            'quantity' => 'required|numeric',
            'price' => 'numeric',
            'description' => 'string|max:255',
            'file' => 'mimes:jpeg,png,jpg,gif,svg|max:4096'
        ]);

        if($validator->fails()){
            return response()->json($validator->errors()->toJson(), 400);
        }

        if (Product::where('id', $id)->exists()) {
            $product =  Product::find($id);
            $image_url = "";

            if (!is_null($request->file('file'))){
            $filename = substr($product->image_url, 9);
            Storage::disk('public')->delete($filename);

            $fileName = time().'_'.$request->file->getClientOriginalName();
            $filePath = $request->file('file')->storeAs('/', $fileName, 'public');
            $image_url = '/storage/' . $filePath;
            }


            $product->name = is_null($request->get('name')) ? $product->name : $request->get('name');
            $product->SKU = is_null($request->get('SKU')) ? $product->SKU : $request->get('SKU');
            $product->quantity = is_null($request->get('quantity')) ? $product->quantity : $request->get('quantity');
            $product->price = is_null($request->get('price'))? $product->price :  $request->get('price');
            $product->description = is_null($request->get('description')) ? $product->description : $request->get('description');
            $product->image_url = is_null($request->file('file')) ? $product->image_url : $image_url;

            $product->save();
            return response()->json([
                "message" => "records updated successfully"
            ], 200);
        } else {
            return response()->json([
                "message" => "Product not found"
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

        $product =  Product::find($id);
        $filename = substr($product->image_url, 9);
        Storage::disk('public')->delete($filename);
        $product = Product::destroy($id);
        return response()->json([
            "message" => "record removed successfully"
        ], 200);
    }
}
