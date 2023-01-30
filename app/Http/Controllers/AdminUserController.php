<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Http\Requests;

class AdminUserController extends Controller
{
    public function index(Request $request)
    {
        $users = User::orderBy('name','ASC')->paginate(5);
        $value=($request->input('page',1)-1)*5;
        return view('adminusers.list',compact('users'))->with('i',$value);
    }
    public function create()
    {
        return view('adminusers.create');
    }

    public function store(Request $request)
    {
        $this->validate($request, ['name' => 'required','email' => 'required']);
        $data = $request->all();
        $data['password'] = Hash::make($data['password']);
        User::create($data);
        return redirect()->route('adminusers.index')->with('success', 'Your user added successfully!');
    }

    public function show($id)
    {
        $user = User::find($id);
        return view('adminusers.show',compact('user'));
    }

    public function edit($id)
    {
        $user = User::find($id);
        return view('adminusers.edit', compact('user'));
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required', 'email' => 'required'
        ]);

        $data = $request->all();
        $data['password'] = Hash::make($data['password']);

        User::find($id)->update($data);
        return redirect()->route('adminusers.index')->with('success','user updated successfully');
    }

    public function destroy($id)
    {
        User::find($id)->delete();
        return redirect()->route('adminusers.index')->with('success','user removed successfully');
    }
}
