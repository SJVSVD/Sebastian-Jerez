<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\Cabana;
use Illuminate\Http\Request;

class CabanasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Cabana::all();
    }

    public function store(Request $request)
    {
        $cabana = new Cabana();
        $cabana->Nombre = $request->Nombre;
        $cabana->Descripcion = $request->Descripcion;
        $cabana->Direccion = $request->Direccion;
        $cabana->Precio = $request->Precio;
        $cabana->save();
        return $cabana;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cabana  $cabana
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Cabana::find($id);
    }

    public function update(CabanasRequest $request,Cabanas $cabana)
    {
        $cabana->Nombre = $request->Nombre;
        $cabana->Descripcion = $request->Descripcion;
        $cabana->Direccion = $request->Direccion;
        $cabana->Precio = $request->Precio;
        $cabana->save();
        return $cabana;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cabana  $cabana
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cabana $cabana)
    {
        $cabana->delete();

        return response()->noContent();
    }
}
