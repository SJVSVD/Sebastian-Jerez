<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CabanasRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'nombre'=>'required|min:5',
            'descripcion'=>'required|max:250',
            'direccion'=>'required',
            'precio'=>'required|numeric|gte:1',
        ];
    }

    public function messages(){
        return[
            'nombre.required'=>'Se necesita nombre de la cabaña',
            'nombre.min'=>'se requiere que su nombre tenga al menos 5 letras',
            'descripcion.required'=>'Se requiere una descripcion',
            'precio.required'=>'Se requiere el precio',
            'precio.gte'=>'El precio debe ser mayor a 0',
            'precio.numeric'=>'Debe ser un numero',
            'direccion.required'=>'required|min:20',
        ];
    }
}
