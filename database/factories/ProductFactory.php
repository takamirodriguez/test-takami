<?php

namespace Database\Factories;

use App\Models\Product;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Product::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            //
            'name' => $this->faker->unique()->company,
            'SKU' => $this->faker->unique()->text(10) ,
            'quantity' => $this->faker->randomDigit(),
            'price' => $this->faker->randomFloat(),
            'description' => $this->faker->sentence($nbWords = 6, $variableNbWords = true),
            'image_url' => null,

        ];
    }
}
