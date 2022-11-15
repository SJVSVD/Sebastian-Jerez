<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Cabana>
 */
class CabanaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'Nombre' => fake()->name(),
            'Descripcion' => fake()->text(),
            'Direccion' => fake()->address(),
            'Precio' => fake()->numberBetween(100, 1000),
        ];
    }
}
