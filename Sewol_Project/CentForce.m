function f_c=CentForce(m_ship,vy_ship,r)
f_c=m_ship*(vy_ship.^2)./r;
end