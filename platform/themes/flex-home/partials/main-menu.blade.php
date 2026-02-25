<ul {!! $options !!}>
    @foreach ($menu_nodes->loadMissing('metadata') as $key => $row)
        <li class="menu-item @if ($row->has_child) menu-item-has-children @endif {{ $row->css_class }} @if ($row->active) current-menu-item @endif">
            <a href="{{ url($row->url) }}" target="{{ $row->target }}">
                {!! $row->icon_html !!} {{ $row->title }}
            </a>
@if ($row->has_child)
<span class="fas fa-angle-down sub-toggle-desktop"></span>
<span class="sub-toggle"></span>
{!!
    Menu::generateMenu([
        'menu' => $menu,
        'view' => 'main-menu',
        'options' => ['class' => 'sub-menu'],
        'menu_nodes' => $row->child,
    ])
!!}
@endif
</li>
@endforeach
</ul>
