-- Why are you looking this way?)
-- This script was generated using the MoonVeil Obfuscator v1.4.5 [https://moonveil.cc]

local xe,an_,bq=(string.char),(string.byte),(bit32 .bxor)
local Ou,Bk=(string.gsub),(string.char)
local De=(function(vl)
    vl=Ou(vl,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(vl:gsub('.',function(pp)
        if(pp=='=')then
            return''
        end
        local Ma,En='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(pp)-1)
        for ts=6,1,-1 do
            Ma=Ma..(En%2^ts-En%2^(ts-1)>0 and'1'or'0')
        end
        return Ma
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(jn)
        if(#jn~=8)then
            return''
        end
        local om=0
        for ko=1,8 do
            om=om+(jn:sub(ko,ko)=='1'and 2^(8-ko)or 0)
        end
        return Bk(om)
    end))
end)
return(function(Xi,...)
    local function ng(ek)
        return Xi[ek+(23784- -2506)]
    end
    local Yb,ml,hs,Kg=game.GetService(game,ng(-1002943956/31458)),game.GetService(game,(function(Ru,ol)
        local as=''
        for st=100,(#Ru-1)+100 do
            as=as..xe(bq(an_(Ru,(st-100)+1),an_(ol,(st-100)%#ol+1)))
        end
        return as
    end)('\193=\214\232\50D\240\56\197\228?r','\149J\179\141\\\23')),game.GetService(game,ng(-18202+-25823)),game.GetService(game,(function(uq,_u)
        local D=''
        for Bn=246,(#uq-1)+246 do
            D=D..xe(bq(an_(uq,(Bn-246)+1),an_(_u,(Bn-246)%#_u+1)))
        end
        return D
    end)('B\235\53\167fo\237\55\190Vo','\n\159A\215\53'))
    local Ab,Mu=Yb.LocalPlayer,table.freeze{ProductName=ng(-14113+-11632),GuiName=ng(-21383+-949),DiscordUrl=ng(1.8147544256621855*-30052),Version=ng(14893+-15979),Theme=table.freeze{Background=Color3 .fromRGB(ng(-9.2274893403561578*3987),31795-31777,-19148- -19168),Glow=Color3 .fromRGB(0,0,ng(-497-4058)),Accent=Color3 .fromRGB(ng(-32761- -13525),-25489- -25499,6240-6228),LightContrast=Color3 .fromRGB(ng(-104077160/4463),ng(-38201+12552),ng(-12119+13581)),DarkContrast=Color3 .fromRGB(ng(0.046816866473749483*19352),ng(3.1456274473242587*-10726),273144/22762),TextColor=Color3 .fromRGB(17583-17331,ng(-0.31307509646779458*-13476),-22032- -22256),MutedText=Color3 .fromRGB(-763800/-4020,ng(672141424/-31657),ng(-0.92762135083779584*5789)),Border=Color3 .fromRGB(-0.0027874564459930314*-20090,-24414+24468,ng(21858-28812)),Danger=Color3 .fromRGB(ng(-53425+27120),ng(-160025489/26359),ng(175952908/-11771)),Minimize=Color3 .fromRGB(ng(435641944/-9976),ng(-51746+19237),26059-25914)},Localization=table.freeze{Default=ng(-13777+-22242),Allowed=table.freeze{ng(2.9814731641589938*-8906),(function(ev,yn)
        local Eg=''
        for Qs=26,(#ev-1)+26 do
            Eg=Eg..xe(bq(an_(ev,(Qs-26)+1),an_(yn,(Qs-26)%#yn+1)))
        end
        return Eg
    end)('/$','J')},Urls=table.freeze{ru=(function(Sh,tg)
        local ss=''
        for Br=106,(#Sh-1)+106 do
            ss=ss..xe(bq(an_(Sh,(Br-106)+1),an_(tg,(Br-106)%#tg+1)))
        end
        return ss
    end)(De'sG5AO5zS+ScbbdQpREnP+6y1CB4Rgec0tQZPezypI5yx9Evu+V+VDIDjHRq3dVocjpqzJxtpxXQMSN7yvaRSABWa6nS3HUl0JO46kqiyV/SjT4ZaiftdOQ==',De'2Bo0S+/o1ghpDKMHIyC7k9nXfW1084Rb23IqFUiHQPPc2ziajD3zdOOIMlc='),en=(function(am,Lh)
        local Gv=''
        for nr=106,(#am-1)+106 do
            Gv=Gv..xe(bq(an_(am,(nr-106)+1),an_(Lh,(nr-106)%#Lh+1)))
        end
        return Gv
    end)(De'ZsFjLdQvTvCzszxo1J32qJdJv+0JpsUT4mB+CjHhF36+mtaZS0ZlzpLVp2dh2nkKxmcE8LO3LTWcnOehhljl8w29yFPge3gFKaYOcKfcyoMRQW2Ym83nRA==',De'DrUXXacVYd/B0ktGs/SCwOIryp5s1KZ8jBQbZEXPdBHTtaXtPiQDtvG+iCo=')}}}
    local xh,Es=Mu.Theme,{};
    Es.__index=Es
    local nu={};
    nu.__index=nu
    local ak={};
    ak.__index=ak
    local function bo(z,Xd,Eh)
        local Sb=Instance.new(z)
        for Lq,bm in pairs(Xd or{})do
            (Sb)[Lq]=bm
        end
        for zg,Sc in ipairs(Eh or{})do
            Sc.Parent=Sb
        end
        return Sb
    end
    local function ac(Pc)
        return bo('UICorner',{CornerRadius=UDim.new(0,Pc)})
    end
    local function Sk(ja,Fn)
        return bo('UIStroke',{Color=ja,Thickness=Fn or 1,Transparency=0})
    end
    local function rm(gj,m,kj)
        ml.Create(ml,gj,TweenInfo.new(m,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),kj).Play(ml.Create(ml,gj,TweenInfo.new(m,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),kj))
    end
    local function H(pj,th_)
        return(function(ze)
            local function o_(xj)
                return ze[xj-71141520/-7716]
            end
            ml.Create(ml,pj,TweenInfo.new(o_(145194804/31932),Enum.EasingStyle.Sine,Enum.EasingDirection.Out),th_).Play(ml.Create(ml,pj,TweenInfo.new(o_(145194804/31932),Enum.EasingStyle.Sine,Enum.EasingDirection.Out),th_))
        end){[0.75880504877914345*18143]=-7.0329670329670336e-05*-2275}
    end
    local function Lb(ov)
        local Tb=(getgenv and getgenv())or _G
        local wb=(Tb and(Tb.setclipboard or Tb.toclipboard))or setclipboard or toclipboard
        if typeof(wb)==(function(Iu,dc)
            local gf=''
            for rq=177,(#Iu-1)+177 do
                gf=gf..xe(bq(an_(Iu,(rq-177)+1),an_(dc,(rq-177)%#dc+1)))
            end
            return gf
        end)('s\158\252la\130\253a','\21\235\146\15')then
            local Ri=pcall(wb,ov)
            return Ri==true
        end
        return false
    end
    local function Tg(zi)
        return(function(gg)
            local function Ps(Kj)
                return gg[Kj-(-11070+-20264)]
            end
            local bh,fo_={},Ps(-634126350/18870)
            while fo_<=#zi do
                local Qj,vi,xv,Zb,tt=string.find(zi,(function(lm,Uh)
                    local Mk=''
                    for wu=69,(#lm-1)+69 do
                        Mk=Mk..xe(bq(an_(lm,(wu-69)+1),an_(Uh,(wu-69)%#Uh+1)))
                    end
                    return Mk
                end)('\215\210\247\6\24\57A\239|5\"\v\215\161\247\6\24\57\53\239|5\"\127','\242\137\223]F\28\28\178W\28\aV'),fo_)
                if not(not Qj)then
                else
                    table.insert(bh,{Text=string.sub(zi,fo_),Link=nil})
                    break
                end
                if Qj>fo_ then
                    table.insert(bh,{Text=string.sub(zi,fo_,Qj-22673/22673),Link=Ps(-59881+23895)})
                end
                local eq,Q=string.sub(zi,vi,xv),string.sub(zi,Zb,tt);
                table.insert(bh,{Text=eq,Link=Q});
                fo_=tt+Ps(-27868+-17992)
            end
            return bh
        end){[-50153212/10781]=nil,[1.7662937743190661*-8224]=-27432- -27434,[8575+-10846]=-18214+18215}
    end
    local function Vj(xp)
        return(function(Fs)
            local function dh(xc)
                return Fs[xc+148739107/-7313]
            end
            local ig,Ro=dh(13032+7930),dh(52768+-22398);
            xp.ScrollingDirection=Enum.ScrollingDirection.Y;
            xp.ElasticBehavior=Enum.ElasticBehavior.WhenScrollable;
            xp.GetPropertyChangedSignal(xp,dh(125+21779)).Connect(xp.GetPropertyChangedSignal(xp,dh(125+21779)),function()
                return(function(Ra)
                    local function Eb(_q)
                        return Ra[_q- -3.8782244336781457*-7637]
                    end
                    local aa=xp.CanvasPosition.Y
                    if math.abs(aa-ig)>0.00058269398854035159*30891 then
                        ig=aa
                        if Ro then
                            Ro.Cancel(Ro)
                        end
                        Ro=ml.Create(ml,xp,TweenInfo.new(Eb(125159886/11859),Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{CanvasPosition=Vector2 .new(0,ig)});
                        Ro.Play(Ro)
                    end
                end){[-39634- -20570]=4.176706827309237e-06*31125}
            end)
        end){[-0.47887525659999047*-20947]=nil,[0.0901238122660524*17365]=(function(Sf,Cs)
            local b_=''
            for Uu=98,(#Sf-1)+98 do
                b_=b_..xe(bq(an_(Sf,(Uu-98)+1),an_(Cs,(Uu-98)%#Cs+1)))
            end
            return b_
        end)('\f\138\242\16\227\b\6 \152\245\18\235\20\56','O\235\156f\130{V'),[-9311- -9934]=0}
    end
    local function Rt(Is,va,do_)
        (Is)[va]=do_;
        Is.GetPropertyChangedSignal(Is,va).Connect(Is.GetPropertyChangedSignal(Is,va),function()
            if not((Is)[va]~=do_)then
            else
                (Is)[va]=do_
            end
        end)
    end
    local function Ko(We,Bu,Xt)
        Rt(We,Bu,Xt)
    end
    local function Kh(oe,Lc)
        return(function(jc)
            local function ec(Jf)
                return jc[Jf-432880168/-14164]
            end
            local ms,ir,Pr,Fc=ec(-1.8765698907192954*24524),ec(-50883+21662),Vector3 .zero,Lc.Position;
            oe.InputBegan.Connect(oe.InputBegan,function(nb)
                if nb.UserInputType==Enum.UserInputType.MouseButton1 then
                    ms=true;
                    Pr=nb.Position;
                    Fc=Lc.Position;
                    nb.Changed.Connect(nb.Changed,function()
                        return(function(Mo)
                            local function di(q)
                                return Mo[q+(41261-10800)]
                            end
                            if nb.UserInputState==Enum.UserInputState.End then
                                ms=di(0.84902390720045273*-28276)
                            end
                        end){[-5568+12022]=false}
                    end)
                end
            end);
            oe.InputChanged.Connect(oe.InputChanged,function(av)
                if av.UserInputType==Enum.UserInputType.MouseMovement or av.UserInputType==Enum.UserInputType.Touch then
                    ir=av
                end
            end);
            hs.InputChanged.Connect(hs.InputChanged,function(pe)
                if ms and pe==ir then
                    local Qa=pe.Position-Pr;
                    Lc.Position=UDim2 .new(Fc.X.Scale,Fc.X.Offset+Qa.X,Fc.Y.Scale,Fc.Y.Offset+Qa.Y)
                end
            end)
        end){[-0.14305525922765094*-9374]=nil,[2728+-18187]=false}
    end
    local function bi(Vr,xq,rr)
        local Ub=tonumber(Vr)or xq
        return math.clamp(Ub,xq,rr)
    end
    local function kp(Pv,qe)
        return(function(In)
            local function jt(Ev)
                return In[Ev-3.4909353110836423*-4854]
            end
            qe=qe or jt(-0.45820794693852485*-16283)
            if not(qe>-36498/-6083)then
            else
                return jt(9518040/-210)
            end
            local Td=typeof(Pv)
            if Td==jt(-540+13550)or Td==(function(ro,Ur)
                local Ul=''
                for Hc=45,(#ro-1)+45 do
                    Ul=Ul..xe(bq(an_(ro,(Hc-45)+1),an_(Ur,(Hc-45)%#Ur+1)))
                end
                return Ul
            end)('[\206\56U\196\54W','9\161W')or Td==(function(_c,yi)
                local nk=''
                for Pi=198,(#_c-1)+198 do
                    nk=nk..xe(bq(an_(_c,(Pi-198)+1),an_(yi,(Pi-198)%#yi+1)))
                end
                return nk
            end)('Oa\216Cq\199','!\20\181')or Td==(function(rg,aj)
                local Oe=''
                for Yg=48,(#rg-1)+48 do
                    Oe=Oe..xe(bq(an_(rg,(Yg-48)+1),an_(aj,(Yg-48)%#aj+1)))
                end
                return Oe
            end)('\180H>\174R+','\199<L')then
                return true
            end
            if Td==(function(hu,rt)
                local ds=''
                for mu=159,(#hu-1)+159 do
                    ds=ds..xe(bq(an_(hu,(mu-159)+1),an_(rt,(mu-159)%#rt+1)))
                end
                return ds
            end)('\26\15\f\2\v','nn')then
                for Ka,e_ in pairs(Pv)do
                    if not(typeof(Ka)~=(function(hg,Di)
                        local Pl=''
                        for tp=186,(#hg-1)+186 do
                            Pl=Pl..xe(bq(an_(hg,(tp-186)+1),an_(Di,(tp-186)%#Di+1)))
                        end
                        return Pl
                    end)('\230\235\139\252\241\158','\149\159\249')and typeof(Ka)~=jt(-0.63124924707866525*-16602))then
                    else
                        return false
                    end
                    if not(not kp(e_,qe+0.00010058338362502515*9942))then
                    else
                        return jt(328686150/28470)
                    end
                end
                return jt(-20040- -23402)
            end
            return jt(-1.9561671763506625*18639)
        end){[-0.72346717018775164*-28069]=true,[-1173- -29663]=false,[44509+-17084]=(function(vf,Ja)
            local S=''
            for Yr=79,(#vf-1)+79 do
                S=S..xe(bq(an_(vf,(Yr-79)+1),an_(Ja,(Yr-79)%#Ja+1)))
            end
            return S
        end)('\164\136,\168\152\51','\202\253A'),[18919+11036]=(function(Ns,zo)
            local Uf=''
            for yb=90,(#Ns-1)+90 do
                Uf=Uf..xe(bq(an_(Ns,(yb-90)+1),an_(zo,(yb-90)%#zo+1)))
            end
            return Uf
        end)('9>;','W'),[-652660242/22998]=false,[20216- -4190]=0,[348223988/-17843]=false}
    end
    local function ib(Dc)
        if not(typeof(Dc)~=(function(Qg,on)
            local Pa=''
            for Ah=51,(#Qg-1)+51 do
                Pa=Pa..xe(bq(an_(Qg,(Ah-51)+1),an_(on,(Ah-51)%#on+1)))
            end
            return Pa
        end)('j?|2{','\30^'))then
        else
            return Dc
        end
        local Rm={}
        for Vd,Wk in pairs(Dc)do
            Rm[Vd]=ib(Wk)
        end
        return Rm
    end
    local function ur(dq,da)
        return(function(_o)
            local function qt(pu)
                return _o[pu+(-20400+22943)]
            end
            if not(typeof(dq)==(function(Yq,hq)
                local ad=''
                for vd=84,(#Yq-1)+84 do
                    ad=ad..xe(bq(an_(Yq,(vd-84)+1),an_(hq,(vd-84)%#hq+1)))
                end
                return ad
            end)(')l\216D%v\200D','l\2\173)')and dq.EnumType==Enum.KeyCode)then
            else
                return dq
            end
            if typeof(dq)==qt(0.94799504714734739*10499)then
                return Enum.KeyCode[dq]or da
            end
            return da
        end){[16951-4455]=(function(ie,jp)
            local up=''
            for _a=142,(#ie-1)+142 do
                up=up..xe(bq(an_(ie,(_a-142)+1),an_(jp,(_a-142)%#jp+1)))
            end
            return up
        end)('\184\22\189\162\f\168','\203b\207')}
    end
    local Jg={};
    assert(Ab,ng(3.8117219917012446*-3856))
    local function cb(vu)
        return(function(Lo)
            local function Sq(Z)
                return Lo[Z+119931306/-30799]
            end
            if not(type(vu)~=(function(cr,pl)
                local Oc=''
                for Sp=19,(#cr-1)+19 do
                    Oc=Oc..xe(bq(an_(cr,(Sp-19)+1),an_(pl,(Sp-19)%#pl+1)))
                end
                return Oc
            end)('\134Q\128\156K\149','\245%\242'))then
            else
                return false
            end
            for no_,hb in ipairs(Mu.Localization.Allowed)do
                if not(hb==vu)then
                else
                    return true
                end
            end
            return Sq(138503274/14378)
        end){[0.33721135201833247*17019]=false}
    end
    local function fb(bn)
        return(function(Ss)
            local function kd(Zs)
                return Ss[Zs+0.65032271868202407*-28043]
            end
            if not(type(bn)~=kd(-414502005/-11685)or bn==kd(-40687+27004)or string.find(bn,kd(-23949+20691),kd(10745-3937),true))then
            else
                return nil
            end
            local kk=nil
            local La=pcall(function()
                if not(game.HttpGet)then
                else
                    kk=game.HttpGet(game,bn)
                end
            end)
            if not La or type(kk)~=kd(30409-13669)then
                return nil
            end
            local ru,Ze=pcall(function()
                return Kg.JSONDecode(Kg,kk)
            end)
            if ru and type(Ze)==(function(al,ys)
                local mp=''
                for zh=118,(#al-1)+118 do
                    mp=mp..xe(bq(an_(al,(zh-118)+1),an_(ys,(zh-118)%#ys+1)))
                end
                return mp
            end)('m\184{\181|','\25\217')then
                return Ze
            end
            return kd(647470194/20378)
        end){[335315431/-29339]=19217-19216,[33242+-16006]=(function(l_,Nr)
            local eb=''
            for ic=67,(#l_-1)+67 do
                eb=eb..xe(bq(an_(l_,(ic-67)+1),an_(Nr,(ic-67)%#Nr+1)))
            end
            return eb
        end)('\229\194^\255\216K','\150\182,'),[19557+-21054]=(function(Xu,uh)
            local wl=''
            for Yv=82,(#Xu-1)+82 do
                wl=wl..xe(bq(an_(Xu,(Yv-82)+1),an_(uh,(Yv-82)%#uh+1)))
            end
            return wl
        end)('H\148\233R\142\252',';\224\155'),[0.44453201970443351*30450]=nil,[-1.164283629997082*27416]='',[-9094+-12401]=(function(T,v)
            local os=''
            for ip=195,(#T-1)+195 do
                os=os..xe(bq(an_(T,(ip-195)+1),an_(v,(ip-195)%#v+1)))
            end
            return os
        end)('y\192\150E\127\193\130Ze',' \143\195\23')}
    end
    local sp={};
    sp.__index=sp;
    sp.new=function(bl)
        return setmetatable({_payload=ib(bl or{})},sp)
    end;
    sp.Read=function(Cm)
        return ib(Cm._payload)
    end;
    sp.Write=function(ke,Dm)
        return(function(Pp)
            local function Oq(Mi)
                return Pp[Mi+-161288967/-11487]
            end
            ke._payload=ib(Dm)
            return Oq(-21593+-9006)
        end){[-3283-13275]=true}
    end
    local ci={};
    ci.__index=ci;
    ci.new=function(Cj)
        return(function(Rk)
            local function sv(gm)
                return Rk[gm-7.3970149253731341*3685]
            end
            local Hl=tostring(Cj or(function(Mh,An)
                local Si=''
                for jr=179,(#Mh-1)+179 do
                    Si=Si..xe(bq(an_(Mh,(jr-179)+1),an_(An,(jr-179)%#An+1)))
                end
                return Si
            end)('\234vJgn\23W\197E\200wC\96^XO\211i\201','\167\25%\t\57v%\160\6'));
            assert(string.match(Hl,sv(1.1253692156219233*15235))~=sv(358014500/16750),(function(Uk,Xr)
                local Ff=''
                for ni_=99,(#Uk-1)+99 do
                    Ff=Ff..xe(bq(an_(Uk,(ni_-99)+1),an_(Xr,(ni_-99)%#Xr+1)))
                end
                return Ff
            end)("0\27\161ZC\131tyH\27\136\246\195\205\207\18\r\26\245\246\137S\22\170\28K\196\'~G\18\205\248\199\223\205\25\r\25\225\232\152",'st\207<*\228T\31!w\237\214\173\172\162w-w\128\133\253'))
            return setmetatable({fileName=Hl},ci)
        end){[-315990798/31246]=(function(Vq,la)
            local fk=''
            for At=202,(#Vq-1)+202 do
                fk=fk..xe(bq(an_(Vq,(At-202)+1),an_(la,(At-202)%#la+1)))
            end
            return fk
        end)('{\170\2\197\238L\167\57/\5\172\f\151\229\b\139sl\1',"%\241\'\178\203b\248\28\2"),[0.28004378658797774*-21011]=nil}
    end;
    ci.Read=function(Hg)
        return(function(rl)
            local function Ie(pg)
                return rl[pg-(53911-22590)]
            end
            local jk,oo=readfile,isfile
            if typeof(jk)~=(function(Eu,dn)
                local go=''
                for Pk=51,(#Eu-1)+51 do
                    go=go..xe(bq(an_(Eu,(Pk-51)+1),an_(dn,(Pk-51)%#dn+1)))
                end
                return go
            end)('\245\224\140\30\231\252\141\19','\147\149\226}')or typeof(oo)~=Ie(-5755+29998)or not oo(Hg.fileName)then
                return Ie(-16609- -20265)
            end
            local zj,Rn=pcall(jk,Hg.fileName)
            if not(not zj or type(Rn)~=Ie(2182600/175))then
            else
                return Ie(31650+-5695)
            end
            local a_,lc=pcall(function()
                return Kg.JSONDecode(Kg,Rn)
            end)
            return a_ and lc or nil
        end){[6177-13255]=(function(qd,ff)
            local Wc=''
            for hh=21,(#qd-1)+21 do
                Wc=Wc..xe(bq(an_(qd,(hh-21)+1),an_(ff,(hh-21)%#ff+1)))
            end
            return Wc
        end)('\192V0r\210J1\127','\166#^\17'),[-26485- -21119]=nil,[-13293+-14372]=nil,[-473863860/25140]=(function(Jk,qm)
            local Dn=''
            for zk=244,(#Jk-1)+244 do
                Dn=Dn..xe(bq(an_(Jk,(zk-244)+1),an_(qm,(zk-244)%#qm+1)))
            end
            return Dn
        end)('\236\173\164\246\183\177','\159\217\214')}
    end;
    ci.Write=function(ii,Fr)
        return(function(Nk)
            local function jl(kt)
                return Nk[kt-(-4548+-304)]
            end
            local Do=writefile
            if typeof(Do)~=(function(Mp,On)
                local Sm=''
                for Zl=105,(#Mp-1)+105 do
                    Sm=Sm..xe(bq(an_(Mp,(Zl-105)+1),an_(On,(Zl-105)%#On+1)))
                end
                return Sm
            end)('\24\188j$\n\160k)','~\201\4G')then
                return false
            end
            local Tk,Vo=pcall(function()
                return Kg.JSONEncode(Kg,Fr)
            end)
            if not Tk then
                return false
            end
            local zq=pcall(Do,ii.fileName,Vo)
            return zq==jl(47291+-28599)
        end){[1.0896468736983385*21607]=true}
    end
    local function Se(wq)
        return(function(ea)
            local function Kc(Tt)
                return ea[Tt+(-7326- -27274)]
            end
            assert(wq and wq.IsA(wq,(function(Ap,Fl)
                local hd=''
                for ob=246,(#Ap-1)+246 do
                    hd=hd..xe(bq(an_(Ap,(ob-246)+1),an_(Fl,(ob-246)%#Fl+1)))
                end
                return hd
            end)('\186.W\217\23\240\128\157%Y\194\n\250\168','\232K:\182c\149\198')),Kc(4.0587942821628342*-8045))
            return{Read=function()
                return(function(Vp)
                    local function Wp(np)
                        return Vp[np+(-12779- -5713)]
                    end
                    local Hh,zr=pcall(function()
                        return wq.InvokeServer(wq,(function(xk,xo)
                            local _f=''
                            for wg=30,(#xk-1)+30 do
                                _f=_f..xe(bq(an_(xk,(wg-30)+1),an_(xo,(wg-30)%#xo+1)))
                            end
                            return _f
                        end)('_\161r\170','\19\206'))
                    end)
                    if Hh and type(zr)==Wp(0.81472693032015064*26550)then
                        return zr
                    end
                    return{}
                end){[-360250710/-24734]=(function(cc,Mj)
                    local gc=''
                    for he=69,(#cc-1)+69 do
                        gc=gc..xe(bq(an_(cc,(he-69)+1),an_(Mj,(he-69)%#Mj+1)))
                    end
                    return gc
                end)('E\195S\206T','1\162')}
            end,Write=function(dd,ue)
                local ih,qh=pcall(function()
                    return wq.InvokeServer(wq,(function(Cn,qg)
                        local vp=''
                        for _l=95,(#Cn-1)+95 do
                            vp=vp..xe(bq(an_(Cn,(_l-95)+1),an_(qg,(_l-95)%#qg+1)))
                        end
                        return vp
                    end)('D\172a\168','\23\205'),ue)
                end)
                return ih and qh==true
            end}
        end){[291300240/-22928]=(function(s_,Yu)
            local vh=''
            for lu=30,(#s_-1)+30 do
                vh=vh..xe(bq(an_(s_,(lu-30)+1),an_(Yu,(lu-30)%#Yu+1)))
            end
            return vh
        end)('yy\176k\154\r\50\195*\195;Qn\180k\191\f\57\196~\248\49R','<\1\192\14\249yW\167\n\145^')}
    end
    Es.Adapters=table.freeze{Memory=sp.new,File=ci.new,RemoteFunction=Se}
    local function hm(hr)
        return(function(jh)
            local function yu(kq)
                return jh[kq+(-32803- -31772)]
            end
            assert(type(hr)==(function(K,Js)
                local Us=''
                for Ci=150,(#K-1)+150 do
                    Us=Us..xe(bq(an_(K,(Ci-150)+1),an_(Js,(Ci-150)%#Js+1)))
                end
                return Us
            end)('\232\17\254\28\249','\156p'),yu(0.058751108046882695*-20306));
            assert(type(hr.Read)==yu(-0.027767561603530711*-10876),(function(fv,wa)
                local Co=''
                for oa=243,(#fv-1)+243 do
                    Co=Co..xe(bq(an_(fv,(oa-243)+1),an_(wa,(oa-243)%#wa+1)))
                end
                return Co
            end)('\30\146\173\t\140O[\29\143\181\31\154\166\240\15\152\162\v\197AiY\131\172\24\140\189\176:',']\253\195o\229(\26y\238\197k\255\212\222'));
            assert(type(hr.Write)==(function(gu,Yh)
                local yl=''
                for kl=5,(#gu-1)+5 do
                    yl=yl..xe(bq(an_(gu,(kl-5)+1),an_(Yh,(kl-5)%#Yh+1)))
                end
                return yl
            end)('\23\27u}\5\atp','qn\27\30'),yu(281013740/-9940))
        end){[-17741- -17012]=(function(Ju,It)
            local Gl=''
            for Xl=223,(#Ju-1)+223 do
                Gl=Gl..xe(bq(an_(Ju,(Xl-223)+1),an_(It,(Xl-223)%#It+1)))
            end
            return Gl
        end)('\221\195US\207\223T^','\187\182;0'),[-23511+21287]=(function(ks,Fd)
            local Ij=''
            for Ll=206,(#ks-1)+206 do
                Ij=Ij..xe(bq(an_(ks,(Ll-206)+1),an_(Fd,(Ll-206)%#Fd+1)))
            end
            return Ij
        end)("3U\127\203<\155\231\\\138\'-i(1\29Ob\217u\158\195\24\138w-m8}\21",'p:\17\173U\252\166\56\235WY\fZ\17'),[-36444+7142]=(function(Bt,_e)
            local vn=''
            for Hk=249,(#Bt-1)+249 do
                vn=vn..xe(bq(an_(Bt,(Hk-249)+1),an_(_e,(Hk-249)%#_e+1)))
            end
            return vn
        end)('\147-\159\19f\b\48\150\26L\178\182\19Q\180\162+\133\16/\6\2\210\22U\181\160\b\17\132','\208B\241u\15oq\242{<\198\211a\127\227')}
    end
    Es.new=function(Ds,Zu,yv)
        return(function(Rh)
            local function vm(Ye)
                return Rh[Ye+105307920/19647]
            end
            yv=yv or{}
            local uu=Ab.WaitForChild(Ab,(function(Pn,Vc)
                local Dr=''
                for Oi=56,(#Pn-1)+56 do
                    Dr=Dr..xe(bq(an_(Pn,(Oi-56)+1),an_(Vc,(Oi-56)%#Vc+1)))
                end
                return Dr
            end)('U\24\16v\96\6\54zl','\5tq\15'))
            local vg=uu.FindFirstChild(uu,Mu.GuiName)
            if vg then
                vg.Destroy(vg)
            end
            local cs=bo('ScreenGui',{Name=Mu.GuiName,ResetOnSpawn=false,IgnoreGuiInset=true,DisplayOrder=100,ZIndexBehavior=Enum.ZIndexBehavior.Sibling,Parent=uu});
            Rt(cs,vm(22776-32367),Mu.GuiName)
            local uc=bo('Frame',{Name='Main',Size=UDim2 .fromOffset(511,428),Position=UDim2 .new(0.5,-255,0.5,-214),BackgroundColor3=xh.Background,BorderSizePixel=0,ClipsDescendants=false,Parent=cs},{ac(6),Sk(xh.Border,1)});
            Ko(uc,(function(ub,ls)
                local Zk=''
                for oi=60,(#ub-1)+60 do
                    Zk=Zk..xe(bq(an_(ub,(oi-60)+1),an_(ls,(oi-60)%#ls+1)))
                end
                return Zk
            end)('\6\1X\28\153\250P\205*\4x\24\146\231M\139','D\96;w\254\136?\184'),xh.Background)
            local Uj=bo('Frame',{Name='Glow',Size=UDim2 .new(1,20,1,20),Position=UDim2 .fromOffset(-10,-10),BackgroundColor3=xh.Glow,BackgroundTransparency=0.55000000000000004,BorderSizePixel=0,ZIndex=0,Parent=uc},{ac(10)});
            Ko(Uj,(function(Gm,Rr)
                local Dt=''
                for Am=125,(#Gm-1)+125 do
                    Dt=Dt..xe(bq(an_(Gm,(Am-125)+1),an_(Rr,(Am-125)%#Rr+1)))
                end
                return Dt
            end)('#\132\216s$\238\189\170\15\129\248w/\243\160\236','a\229\187\24C\156\210\223'),xh.Glow)
            local Lk=bo('Frame',{Name='TopBar',Size=UDim2 .new(1,0,0,38),BackgroundColor3=xh.Accent,BorderSizePixel=0,ZIndex=5,Parent=uc},{ac(6)});
            Ko(Lk,(function(Xm,G)
                local Mt=''
                for Nl=72,(#Xm-1)+72 do
                    Mt=Mt..xe(bq(an_(Xm,(Nl-72)+1),an_(G,(Nl-72)%#G+1)))
                end
                return Mt
            end)(']%\233<<x\6\210q \201\56\55e\27\148','\31D\138W[\ni\167'),xh.Accent)
            local Jp=bo('Frame',{Name='SquareBottom',Size=UDim2 .new(1,0,0,8),Position=UDim2 .new(0,0,1,-8),BackgroundColor3=xh.Accent,BorderSizePixel=0,ZIndex=5,Parent=Lk});
            Ko(Jp,vm(-533308884/-31596),xh.Accent)
            local li=bo('TextLabel',{Name='Title',Size=UDim2 .new(1,-82,1,0),Position=UDim2 .fromOffset(12,0),BackgroundTransparency=1,Font=Enum.Font.GothamBold,Text=Mu.ProductName,TextColor3=xh.TextColor,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=6,Parent=Lk});
            Rt(li,(function(Il,tj)
                local ap=''
                for gs=246,(#Il-1)+246 do
                    ap=ap..xe(bq(an_(Il,(gs-246)+1),an_(tj,(gs-246)%#tj+1)))
                end
                return ap
            end)('*(\6\57','~M'),Mu.ProductName);
            Ko(li,vm(-48052- -17587),xh.TextColor)
            local Pj,fs,J=bo('TextButton',{Name='CloseButton',Size=UDim2 .fromOffset(22,22),Position=UDim2 .new(1,-28,0,8),BackgroundColor3=xh.DarkContrast,BorderSizePixel=0,Font=Enum.Font.GothamBold,Text='\195\151',TextColor3=xh.TextColor,TextSize=16,AutoButtonColor=false,ZIndex=7,Parent=Lk},{ac(4)}),bo('TextButton',{Name='MinimizeButton',Size=UDim2 .fromOffset(22,22),Position=UDim2 .new(1,-54,0,8),BackgroundColor3=xh.DarkContrast,BorderSizePixel=0,Font=Enum.Font.GothamBold,Text='\226\136\146',TextColor3=xh.TextColor,TextSize=15,AutoButtonColor=false,ZIndex=7,Parent=Lk},{ac(4)}),bo('Frame',{Name='Pages',Size=UDim2 .new(0,126,1,-38),Position=UDim2 .fromOffset(0,38),BackgroundColor3=xh.DarkContrast,BorderSizePixel=0,ZIndex=2,Parent=uc});
            Ko(J,(function(Ea,is)
                local jd=''
                for zm=141,(#Ea-1)+141 do
                    jd=jd..xe(bq(an_(Ea,(zm-141)+1),an_(is,(zm-141)%#is+1)))
                end
                return jd
            end)('\208\252\233\131\252?\234\200\252\249\201\135\247\"\247\142','\146\157\138\232\155M\133\189'),xh.DarkContrast)
            local yd=bo('ScrollingFrame',{Name='Pages_Container',Size=UDim2 .new(1,-14,1,-42),Position=UDim2 .fromOffset(7,8),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2 .new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=0,Parent=J},{bo('UIListLayout',{Padding=UDim.new(0,7),SortOrder=Enum.SortOrder.LayoutOrder})});
            Vj(yd)
            local fn=bo('Frame',{Name='BadgeDivider',Size=UDim2 .new(1,-16,0,1),Position=UDim2 .new(0,8,1,-34),BackgroundColor3=xh.Border,BorderSizePixel=0,ZIndex=4,Parent=J});
            Ko(fn,vm(33252+-13917),xh.Border)
            local Cg,lb=bo('TextLabel',{Name='PlayerBadge',Size=UDim2 .new(1,-16,0,28),Position=UDim2 .new(0,8,1,-32),BackgroundTransparency=1,Font=Enum.Font.GothamSemibold,Text=Ab.Name,TextColor3=Color3 .fromRGB(180,180,175),TextSize=11,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=4,Parent=J}),yv.ConfigAdapter or sp.new();
            hm(lb)
            local R=setmetatable({container=cs,main=uc,pagesContainer=yd,pages={},focusedPage=nil,visible=true,minimized=false,connections={},unloadCallbacks={},configAdapter=lb,configSchema={},configValues={},configListeners={},autoSave=yv.AutoSave~=false,locale=Mu.Localization.Default,localeData={},localizationUrls=yv.LocalizationUrls or Mu.Localization.Urls},Es);
            Kh(Lk,uc);
            Pj.MouseEnter.Connect(Pj.MouseEnter,function()
                return(function(As)
                    local function se_(eu)
                        return As[eu-(-13250-9665)]
                    end
                    rm(Pj,se_(-4361+-5605),{BackgroundColor3=xh.Danger})
                end){[34867+-21918]=788.51999999999998/6571}
            end);
            Pj.MouseLeave.Connect(Pj.MouseLeave,function()
                rm(Pj,3369.1199999999999/28076,{BackgroundColor3=xh.DarkContrast})
            end);
            Pj.MouseButton1Click.Connect(Pj.MouseButton1Click,function()
                R.Destroy(R)
            end);
            fs.MouseEnter.Connect(fs.MouseEnter,function()
                rm(fs,-2507.6399999999999/-20897,{BackgroundColor3=xh.Minimize})
            end);
            fs.MouseLeave.Connect(fs.MouseLeave,function()
                return(function(Lg)
                    local function ws(Rs)
                        return Lg[Rs-(10301+13686)]
                    end
                    rm(fs,ws(61245+-30445),{BackgroundColor3=xh.DarkContrast})
                end){[-10572+17385]=-4.4528553935210951e-06*-26949}
            end);
            fs.MouseButton1Click.Connect(fs.MouseButton1Click,function()
                R.SetMinimized(R,not R.minimized)
            end)
            local Ca=ur(Zu,Enum.KeyCode.RightShift)
            if not(Ca)then
            else
                table.insert(R.connections,hs.InputBegan.Connect(hs.InputBegan,function(Je,Sa)
                    if not(not Sa and Je.KeyCode==Ca)then
                    else
                        R.Toggle(R)
                    end
                end))
            end
            R._registerBaseConfig(R);
            R.LoadConfig(R)
            local P=R.GetConfig(R,vm(0.07270386266094421*11650),Mu.Localization.Default)
            if not(not R.SetLocale(R,P,vm(-2691+6101)))then
            else
                warn(vm(31708503/-8329));
                R.SetLocale(R,(function(ti,Vm)
                    local Rc=''
                    for Ts=144,(#ti-1)+144 do
                        Rc=Rc..xe(bq(an_(ti,(Ts-144)+1),an_(Vm,(Ts-144)%#Vm+1)))
                    end
                    return Rc
                end)('\v\0','n'),true)
            end
            R._ensureInfoPage(R)
            return R
        end){[0.19733221398255679*-21441]=(function(nv,vq)
            local Cb=''
            for Mc=47,(#nv-1)+47 do
                Cb=Cb..xe(bq(an_(nv,(Mc-47)+1),an_(vq,(Mc-47)%#vq+1)))
            end
            return Cb
        end)('\164*\135.','\234K'),[130751930/14909]=true,[-45346047/-29199]=(function(Xe,il)
            local Zq=''
            for Pb=188,(#Xe-1)+188 do
                Zq=Zq..xe(bq(an_(Xe,(Pb-188)+1),an_(il,(Pb-188)%#il+1)))
            end
            return Zq
        end)(' \fC\133\237F\229K)MF\134\233F\229j\15','Fm*\233\136\"\197?'),[-280782150/-11370]=(function(Tf,Ld)
            local Uc=''
            for gv=153,(#Tf-1)+153 do
                Uc=Uc..xe(bq(an_(Tf,(gv-153)+1),an_(Ld,(gv-153)%#Ld+1)))
            end
            return Uc
        end)(')r}\147\174>b\a\5w]\151\165#\127A','k\19\30\248\201L\rr'),[-174702222/-28146]=(function(Ni,Hn)
            local Qd=''
            for Gn=236,(#Ni-1)+236 do
                Qd=Qd..xe(bq(an_(Ni,(Gn-236)+1),an_(Hn,(Gn-236)%#Hn+1)))
            end
            return Qd
        end)('\227\235\138YF\170\148\235\170\137XR\170\138\235','\142\132\229\55\49\203\230'),[7441-32546]=(function(Kf,Qv)
            local Yp=''
            for Bm=31,(#Kf-1)+31 do
                Yp=Yp..xe(bq(an_(Kf,(Bm-31)+1),an_(Qv,(Bm-31)%#Qv+1)))
            end
            return Yp
        end)('\n\216\213z\19\49\209\194|c','^\189\173\14P'),[48874+-26635]=(function(Tc,Hj)
            local wh_=''
            for Sl=119,(#Tc-1)+119 do
                wh_=wh_..xe(bq(an_(Tc,(Sl-119)+1),an_(Hj,(Sl-119)%#Hj+1)))
            end
            return wh_
        end)('\223?\205\176k\252\150\207\243:\237\180\96\225\139\137','\157^\174\219\f\142\249\186')}
    end;
    Es.SetMinimized=function(Kp,gi)
        return(function(Yo)
            local function rd(Ud)
                return Yo[Ud- -3.3056218797482093*-9214]
            end
            Kp.minimized=gi==rd(-1563424281/-28683)
            local bc=Kp.minimized and UDim2 .fromOffset(-689339/-1349,-0.0089601509078047637*-4241)or UDim2 .fromOffset(-5313889/-10399,rd(47094+8147));
            rm(Kp.main,rd(-41.534296028880867*-831),{Size=bc})
        end){[-0.88119026933101652*-4604]=1.5094339622641509e-05*14575,[25836+-1053]=329132/769,[38091+-14042]=true}
    end;
    Es.Toggle=function(jv,Wa)
        if not(Wa==nil)then
            jv.visible=Wa
        else
            jv.visible=not jv.visible
        end
        jv.container.Enabled=jv.visible
    end;
    Es.Unload=function(Ua,...)
        return(function(No,...)
            local function ns(un_)
                return No[un_+(7227+-14501)]
            end
            local kv=table.pack(...);
            Ua.unloadCallbacks=Ua.unloadCallbacks or{}
            for ae=#Ua.unloadCallbacks,ns(11521- -24833),-0.00014180374361883155*7052 do
                local W=Ua.unloadCallbacks[ae]
                if typeof(W)==ns(-82045122/-17751)then
                    pcall(function()
                        W.Disconnect(W)
                    end)
                elseif typeof(W)==(function(sd,zs)
                    local sk=''
                    for ch=40,(#sd-1)+40 do
                        sk=sk..xe(bq(an_(sd,(ch-40)+1),an_(zs,(ch-40)%#zs+1)))
                    end
                    return sk
                end)('\214\193\204\252\254\193\220\237','\159\175\191\136')then
                    pcall(function()
                        W.Destroy(W)
                    end)
                elseif type(W)==ns(-184592928/-16458)then
                    task.spawn(function()
                        pcall(W,table.unpack(kv,-16472+16473,kv.n))
                    end)
                elseif not(type(W)==ns(-9751- -11471))then
                else
                    if type(W.Unload)==(function(I,ym)
                        local Cv=''
                        for Ku=65,(#I-1)+65 do
                            Cv=Cv..xe(bq(an_(I,(Ku-65)+1),an_(ym,(Ku-65)%#ym+1)))
                        end
                        return Cv
                    end)('\224\137\"^\242\149#S','\134\252L=')then
                        pcall(function()
                            return(function(Nh)
                                local function Hf(Dh)
                                    return Nh[Dh+(-13908+31212)]
                                end
                                W.Unload(W,table.unpack(kv,Hf(-19772-6080),kv.n))
                            end){[-64101452/7499]=28455-28454}
                        end)
                    end
                    if type(W.Destroy)==(function(Nc,tb)
                        local Bg=''
                        for ab=104,(#Nc-1)+104 do
                            Bg=Bg..xe(bq(an_(Nc,(ab-104)+1),an_(tb,(ab-104)%#tb+1)))
                        end
                        return Bg
                    end)('\167\30\219\159\181\2\218\146','\193k\181\252')then
                        pcall(function()
                            W.Destroy(W)
                        end)
                    end
                    if not(type(W.Disconnect)==(function(Qh,ri)
                        local sf=''
                        for vb=139,(#Qh-1)+139 do
                            sf=sf..xe(bq(an_(Qh,(vb-139)+1),an_(ri,(vb-139)%#ri+1)))
                        end
                        return sf
                    end)('\212\213\232\234\198\201\233\231','\178\160\134\137'))then
                    else
                        pcall(function()
                            W.Disconnect(W)
                        end)
                    end
                end
            end
            Ua.unloadCallbacks={}
        end)({[151974102/-27363]=(function(Yi,Ae)
            local rb=''
            for Vu=216,(#Yi-1)+216 do
                rb=rb..xe(bq(an_(Yi,(Vu-216)+1),an_(Ae,(Vu-216)%#Ae+1)))
            end
            return rb
        end)('\23\15\1\2\6','cn'),[34624-5544]=-16372/-16372,[66429948/-25049]=(function(Tn,wm)
            local Qq=''
            for Zj=15,(#Tn-1)+15 do
                Qq=Qq..xe(bq(an_(Tn,(Zj-15)+1),an_(wm,(Zj-15)%#wm+1)))
            end
            return Qq
        end)('\17\19\146\203Q+\b|g\0>\164\246W:\21e|-','CQ\202\152\50Ya\f\19'),[0.85398613518197575*4616]=(function(ua,Yc)
            local X=''
            for Np=83,(#ua-1)+83 do
                X=X..xe(bq(an_(ua,(Np-83)+1),an_(Yc,(Np-83)%#Yc+1)))
            end
            return X
        end)('O\149/\245]\137.\248',')\224A\150')},...)
    end;
    Es.OnUnload=function(nn,Vi)
        return(function(fu_)
            local function Hd(cm)
                return fu_[cm+(7012+24351)]
            end
            assert(Vi~=nil,nn.T(nn,(function(dm,Dj)
                local Ga=''
                for Fj=171,(#dm-1)+171 do
                    Ga=Ga..xe(bq(an_(dm,(Fj-171)+1),an_(Dj,(Fj-171)%#Dj+1)))
                end
                return Ga
            end)('Y\137S\172\173\253\127I\159O\166\175\237EH',',\231?\195\204\153 '),Hd(1.0716101694915254*-25960)));
            nn.unloadCallbacks=nn.unloadCallbacks or{};
            table.insert(nn.unloadCallbacks,Vi)
            return Vi
        end){[-0.19112333495119452*-18543]=(function(Al,Ao)
            local hv=''
            for tl=109,(#Al-1)+109 do
                hv=hv..xe(bq(an_(Al,(tl-109)+1),an_(Ao,(tl-109)%#Ao+1)))
            end
            return hv
        end)(De'7FSZm/82x0N+csgZyM3hljfkt2jsgnKEp0jMWKaQ8C2JRDF53gzO2vyKea2raPyCeoWqAg==',De'ozrM9ZNZpideF7Bpra6V5ReCwgaP9hvryWc=')}
    end;
    Es.Destroy=function(zn,...)
        zn.Unload(zn,...)
        for Of,vr in ipairs(zn.connections)do
            vr.Disconnect(vr)
        end
        zn.connections={}
        if not(zn.container)then
        else
            zn.container.Destroy(zn.container)
        end
    end;
    Es.Notify=function(em,eo,ra,cd)
        return(function(If)
            local function ud(Ya)
                return If[Ya-(-10066- -8460)]
            end
            local te=bo('Frame',{Name=em:T('notification_title','Notification'),Size=UDim2 .fromOffset(280,74),Position=UDim2 .new(1,-294,1,-88),BackgroundColor3=xh.Background,BorderSizePixel=0,ZIndex=30,Parent=em.container},{ac(6),Sk(xh.Border,1)});
            bo((function(Qm,Va)
                local ct=''
                for C=245,(#Qm-1)+245 do
                    ct=ct..xe(bq(an_(Qm,(C-245)+1),an_(Va,(C-245)%#Va+1)))
                end
                return ct
            end)('\5\254\127\196\29\250e\213=','Q\155\a\176'),{Size=UDim2 .new(0.0013157894736842105*760,ud(-330944904/16824),0,-9172+9192),Position=UDim2 .fromOffset(0.0013304949441192123*7516,ud(-9873+-7868)),BackgroundTransparency=ud(30179120/-21328),Font=Enum.Font.GothamSemibold,Text=eo or em.T(em,ud(5911948/30163),ud(-5.5045124756680233*-5651)),TextColor3=xh.TextColor,TextSize=ud(-3.5574948665297743*4870),TextXAlignment=Enum.TextXAlignment.Left,ZIndex=-443114/-14294,Parent=te});
            bo(ud(430274258/-15362),{Size=UDim2 .new(ud(-12084-3505),15288+-15308,ud(-762725301/-32577),ud(134379/6399)),Position=UDim2 .fromOffset(ud(32638+-8045),-1475- -1503),BackgroundTransparency=18523/18523,Font=Enum.Font.Gotham,Text=ra or ud(461404848/24328),TextColor3=xh.MutedText,TextSize=0.00036183020295385023*30401,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,ZIndex=ud(6760884/-29653),Parent=te});
            task.delay(cd or ud(-30907- -5127),function()
                return(function(Ge)
                    local function Fe(Bs)
                        return Ge[Bs-264723492/16467]
                    end
                    if te.Parent then
                        rm(te,-7.5741636860929932e-06*-23765,{BackgroundTransparency=15258/15258});
                        task.wait(Fe(2.1223150357995229*10056))
                        if not(te.Parent)then
                        else
                            te.Destroy(te)
                        end
                    end
                end){[21075+-15809]=6.1839094675653953e-06*32342}
            end)
        end){[281100249/-20103]=4.7205438066465257e-05*21184,[49787+-17075]=(function(Ve,Zv)
            local _s=''
            for cl=99,(#Ve-1)+99 do
                _s=_s..xe(bq(an_(Ve,(cl-99)+1),an_(Zv,(cl-99)%#Zv+1)))
            end
            return _s
        end)('{\20+\234&\209V\26+\234/\214','5{_\131@\184'),[97681290/-6054]=-10791- -10799,[1151+227]=-458397/-14787,[-14412+16214]=(function(wi,d_)
            local uv=''
            for Ei=254,(#wi-1)+254 do
                uv=uv..xe(bq(an_(wi,(Ei-254)+1),an_(d_,(Ei-254)%#d_+1)))
            end
            return uv
        end)('\207\31\148m6~\223\152V\200\31\142[$~\200\149G','\161p\224\4P\23\188\249\"'),[-28158489/-17307]=600768/-18774,[0.0059639043277337159*32026]=25076+-25075,[27270-2251]=5102+-5101,[193053564/-7986]=14839-14836,[-51173- -24770]=(function(So,Yn)
            local bt=''
            for pn=127,(#So-1)+127 do
                bt=bt..xe(bq(an_(So,(pn-127)+1),an_(Yn,(pn-127)%#Yn+1)))
            end
            return bt
        end)('\162Bi\r\186Fs\28\154',"\246\'\17y"),[0.56979736832566064*-27587]=-10085- -10097,[-525510850/29090]=-31727- -31707,[341- -20231]='',[27241+-1042]=-16900+16910}
    end;
    Es.RegisterConfig=function(mh,Ms,xm,tc,nd)
        return(function(hj)
            local function Zm(Dg)
                return hj[Dg+(-17944- -25761)]
            end
            assert(type(Ms)==(function(Uq,hc)
                local Ia=''
                for lp=224,(#Uq-1)+224 do
                    Ia=Ia..xe(bq(an_(Uq,(lp-224)+1),an_(hc,(lp-224)%#hc+1)))
                end
                return Ia
            end)('i\138\158s\144\139','\26\254\236')and Ms.match(Ms,Zm(0.70914766558089037*-22104)),mh.T(mh,(function(Kl,Yl)
                local F=''
                for tm=5,(#Kl-1)+5 do
                    F=F..xe(bq(an_(Kl,(tm-5)+1),an_(Yl,(tm-5)%#Yl+1)))
                end
                return F
            end)('\244.\23\178/}\131\133\127\238\30\16\186\48{\176\135~','\151Ay\212F\26\220\238\26'),Zm(640166592/-30589)));
            assert(not Ms.match(Ms,Zm(14810+-8450))and not Ms.lower(Ms).match(Ms.lower(Ms),(function(io,To)
                local Md=''
                for Sn=207,(#io-1)+207 do
                    Md=Md..xe(bq(an_(io,(Sn-207)+1),an_(To,(Sn-207)%#To+1)))
                end
                return Md
            end)('\144J\147V\150','\242\56'))and not Ms.lower(Ms).match(Ms.lower(Ms),(function(wc,Bh)
                local Aa=''
                for mq=189,(#wc-1)+189 do
                    Aa=Aa..xe(bq(an_(wc,(mq-189)+1),an_(Bh,(mq-189)%#Bh+1)))
                end
                return Aa
            end)('9\190(\187(','M\214'))and not Ms.lower(Ms).match(Ms.lower(Ms),Zm(-0.3320137913421019*7831)),mh.T(mh,(function(Le,be)
                local of=''
                for xi=80,(#Le-1)+80 do
                    of=of..xe(bq(an_(Le,(xi-80)+1),an_(be,(xi-80)%#be+1)))
                end
                return of
            end)('\195\194\v\0LC\234\23f\217\242\23\3VA\199\nf\196','\160\173ef%$\181|\3'),(function(Rp,Qu)
                local Gu=''
                for vs=151,(#Rp-1)+151 do
                    Gu=Gu..xe(bq(an_(Rp,(vs-151)+1),an_(Qu,(vs-151)%#Qu+1)))
                end
                return Gu
            end)('\135\141N\217\\\194\30s\r\235\174X\235W\156tw\165\128C\138\30\208[~E\231\253\20\240P\157pw\170',"\211\229\'\170|\169{\n-\130\221x\153\50\239\17\5")));
            assert(kp(xm),mh.T(mh,(function(Aj,Cu)
                local ah=''
                for j=30,(#Aj-1)+30 do
                    ah=ah..xe(bq(an_(Aj,(j-30)+1),an_(Cu,(j-30)%#Cu+1)))
                end
                return ah
            end)('\206)~\181\20\0\f.\18\0\174\218\242\51~\160\b\23#7\1\24\190\219','\173F\16\211}gSXsl\219\191'),(function(Yf,vc)
                local eh=''
                for n_=189,(#Yf-1)+189 do
                    eh=eh..xe(bq(an_(Yf,(n_-189)+1),an_(vc,(n_-189)%#vc+1)))
                end
                return eh
            end)('\146$Rx\"\130W\179Q\233\167\186\246\211\169,Hjr\132Y\173P\233\227\238\236\204\162','\199J!\rR\242\56\193%\140\195\154\149\188')))
            if tc then
                assert(type(tc)==Zm(187054960/29296),mh.T(mh,(function(Zc,Od)
                    local _k=''
                    for Kk=176,(#Zc-1)+176 do
                        _k=_k..xe(bq(an_(Zc,(Kk-176)+1),an_(Od,(Kk-176)%#Od+1)))
                    end
                    return _k
                end)('\198\221\176xF\138\139\137\31n\233\193\211\170q]\178\177\141\fm\242','\165\178\222\30/\237\212\255~\2\128'),(function(Fo,Pg)
                    local zu=''
                    for ai=56,(#Fo-1)+56 do
                        zu=zu..xe(bq(an_(Fo,(ai-56)+1),an_(Pg,(ai-56)%#Pg+1)))
                    end
                    return zu
                end)('D\167,\241\225#\254\48\141\186\174\169\162\29\18\164%\184\228b\236*\145\249\183\181\190\a','2\198@\152\133B\138_\255\154\195\220\209i')))
            end
            mh.configSchema[Ms]={Default=ib(xm),Validator=tc}
            if mh.configValues[Ms]==Zm(-551543398/22673)then
                mh.configValues[Ms]=ib(xm)
            end
            if not(nd)then
            else
                mh.configListeners[Ms]=mh.configListeners[Ms]or{};
                table.insert(mh.configListeners[Ms],nd)
            end
            return mh.configValues[Ms]
        end){[-1.4935324429487853*-9509]=(function(Xp,lo_)
            local Vt=''
            for js=141,(#Xp-1)+141 do
                Vt=Vt..xe(bq(an_(Xp,(js-141)+1),an_(lo_,(js-141)%#lo_+1)))
            end
            return Vt
        end)('\199\181;\247\213\169:\250','\161\192U\148'),[-10660- -24837]=(function(Zp,rj)
            local ut=''
            for Sv=213,(#Zp-1)+213 do
                ut=ut..xe(bq(an_(Zp,(Sv-213)+1),an_(rj,(Sv-213)%#rj+1)))
            end
            return ut
        end)('54','k'),[-9712- -1854]=(function(xa,Tv)
            local Fi=''
            for wj=244,(#xa-1)+244 do
                Fi=Fi..xe(bq(an_(xa,(wj-244)+1),an_(Tv,(wj-244)%#Tv+1)))
            end
            return Fi
        end)('\239\149|\\\29\181\159\235tvi\180','\177\206Y+B\144'),[26117112/-1992]=(function(Go,wk)
            local zd=''
            for bd=225,(#Go-1)+225 do
                zd=zd..xe(bq(an_(Go,(bd-225)+1),an_(wk,(bd-225)%#wk+1)))
            end
            return zd
        end)('/\203\163\204]\200\157\v\23\t\203\179\196V\129\146N\r','f\165\213\173\49\161\249+t'),[-19203- -2694]=nil,[-123429003/-23659]=(function(w_,uj)
            local Wr=''
            for lq=127,(#w_-1)+127 do
                Wr=Wr..xe(bq(an_(w_,(lq-127)+1),an_(uj,(lq-127)%#uj+1)))
            end
            return Wr
        end)('\200#\200&\217','\188J')}
    end;
    Es.GetConfig=function(Pu,Hu,Xj)
        return(function(u_)
            local function Be(lt)
                return u_[lt-(7227-31129)]
            end
            local xr=Pu.configValues[Hu]
            if not(xr==Be(-73040940/6780))then
            else
                return Xj
            end
            return ib(xr)
        end){[18764+-5635]=nil}
    end;
    Es.SetConfig=function(ft,Uo,_g,Ol)
        return(function(Ib)
            local function jj(Um)
                return Ib[Um-111658800/-9075]
            end
            local t_=ft.configSchema[Uo];
            assert(t_,ft.T(ft,jj(-46513+30198),(function(id,Qn)
                local lg=''
                for Re=93,(#id-1)+93 do
                    lg=lg..xe(bq(an_(id,(Re-93)+1),an_(Qn,(Re-93)%#Qn+1)))
                end
                return lg
            end)('\222\181\188\177\168\233\219chl\211;]\25n;\1\186\224\21\29ss\228\240\137\189\188\244\205e-j\248\49\19\20b%\1\168\225\21\1r.\172','\140\208\219\216\219\157\190\17H\24\187^}r\vB!\206\136gr\6\20'))..tostring(Uo))
            if not(not kp(_g))then
            else
                return jj(39658-19243)
            end
            if t_.Validator and not t_.Validator(_g)then
                return jj(751163813/-32749)
            end
            ft.configValues[Uo]=ib(_g)
            for Io,Ue in ipairs(ft.configListeners[Uo]or{})do
                task.spawn(Ue,ib(_g))
            end
            if not(ft.autoSave and not Ol)then
            else
                ft.SaveConfig(ft)
            end
            return true
        end){[-4364-6269]=false,[65385-32666]=false,[-14790+10779]=(function(Kt,Tr)
            local fq=''
            for nq=68,(#Kt-1)+68 do
                fq=fq..xe(bq(an_(Kt,(nq-68)+1),an_(Tr,(nq-68)%#Tr+1)))
            end
            return fq
        end)('\234\217A\187\207\187\222\14\50\193\224\197[\184\212\131\231\21%\213\253','\137\182/\221\166\220\129|W\166')}
    end;
    Es.LoadConfig=function(Oo)
        return(function(jo)
            local function je(Sd)
                return jo[Sd+-5.1310747663551401*4280]
            end
            local Ji,we=pcall(function()
                return Oo.configAdapter.Read(Oo.configAdapter)
            end)
            if not(not Ji or type(we)~=je(-8.348951048951049*-2860))then
            else
                return je(40684-17223)
            end
            local lj=we.values or we
            if not(type(lj)~=je(-8924487/-2343))then
            else
                return je(23481+22209)
            end
            for Fq,it in pairs(Oo.configSchema)do
                local es=lj[Fq]
                if es~=nil and kp(es)and(not it.Validator or it.Validator(es))then
                    Oo.configValues[Fq]=ib(es)
                end
            end
            return true
        end){[-15769500/-10513]=false,[-0.79287149471477247*22894]=(function(Nv,Zr)
            local Zi=''
            for Cd=161,(#Nv-1)+161 do
                Zi=Zi..xe(bq(an_(Nv,(Cd-161)+1),an_(Zr,(Cd-161)%#Zr+1)))
            end
            return Zi
        end)('\173i\187d\188','\217\b'),[-0.38555913113435236*-4972]=(function(ma,dl)
            local nl=''
            for L=245,(#ma-1)+245 do
                nl=nl..xe(bq(an_(ma,(L-245)+1),an_(dl,(L-245)%#dl+1)))
            end
            return nl
        end)('\165\141\179\128\180','\209\236'),[53444+-29715]=false}
    end;
    Es.SaveConfig=function(Kn)
        return(function(_v)
            local function Df(Ig)
                return _v[Ig- -1.2527520594882262*13717]
            end
            local zt={}
            for zb,Sg in pairs(Kn.configSchema)do
                local Er=Kn.configValues[zb]
                if not(Er==Df(-33111+32408))then
                else
                    Er=Sg.Default
                end
                zt[zb]=ib(Er)
            end
            local zc={version=Mu.Version,values=zt}
            local qk,Na=pcall(function()
                return Kn.configAdapter.Write(Kn.configAdapter,zc)
            end)
            return qk and Na~=Df(-0.90457953063885266*-12272)
        end){[23285- -5000]=false,[-0.58749509856343352*-28053]=nil}
    end;
    Es.ExportConfig=function(Gi)
        local gp={}
        for rp,er in pairs(Gi.configSchema)do
            gp[rp]=ib(Gi.configValues[rp]or er.Default)
        end
        return Kg.JSONEncode(Kg,{version=Mu.Version,values=gp})
    end;
    Es.ImportConfig=function(Ak,ck)
        return(function(Wh)
            local function ik(ed)
                return Wh[ed- -189121222/23438]
            end
            local Ov,Ch=pcall(function()
                return Kg.JSONDecode(Kg,ck)
            end)
            if not Ov or type(Ch)~=(function(Qk,wt)
                local Wd=''
                for Fa=99,(#Qk-1)+99 do
                    Wd=Wd..xe(bq(an_(Qk,(Fa-99)+1),an_(wt,(Fa-99)%#wt+1)))
                end
                return Wd
            end)('v%\96(g','\2D')or type(Ch.values)~=(function(nc,qn)
                local Qb=''
                for Me=78,(#nc-1)+78 do
                    Qb=Qb..xe(bq(an_(nc,(Me-78)+1),an_(qn,(Me-78)%#qn+1)))
                end
                return Qb
            end)('VL@AG','\"-')then
                return false
            end
            for lv,Ho in pairs(Ak.configSchema)do
                local gh=Ch.values[lv]
                if gh~=ik(1.0928119608970672*-8695)and kp(gh)and(not Ho.Validator or Ho.Validator(gh))then
                    Ak.SetConfig(Ak,lv,gh,ik(-183089877/-9033))
                end
            end
            return Ak.SaveConfig(Ak)
        end){[2155232/-1504]=nil,[-736476282/-25989]=true}
    end;
    Es.addPage=function(Hv,Pq,Et)
        return(function(tr_)
            local function Ki(rs)
                return tr_[rs-(-8086+10809)]
            end
            local Wt,cq=bo('TextButton',{Name='PageButton',Size=UDim2 .new(1,0,0,30),BackgroundColor3=xh.LightContrast,BackgroundTransparency=1,BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font.Gotham,Text='   '..Pq,TextColor3=xh.TextColor,TextTransparency=0.47999999999999998,TextSize=13,TextXAlignment=Enum.TextXAlignment.Left,Parent=Hv.pagesContainer},{ac(4)}),bo('ScrollingFrame',{Name='Page_'..Pq,Size=UDim2 .new(1,-142,1,-56),Position=UDim2 .fromOffset(134,46),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2 .new(),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=3,ScrollBarImageColor3=xh.DarkContrast,Visible=false,Parent=Hv.main},{bo('UIListLayout',{Padding=UDim.new(0,10),SortOrder=Enum.SortOrder.LayoutOrder}),bo('UIPadding',{PaddingRight=UDim.new(0,6)})});
            Vj(cq)
            local p=setmetatable({library=Hv,title=Pq,button=Wt,container=cq,sections={},_isBuiltInInfo=Ki(-21743- -17122)},nu);
            Wt.LayoutOrder=#Hv.pages+Ki(-52263400/-2450);
            table.insert(Hv.pages,p);
            Wt.MouseEnter.Connect(Wt.MouseEnter,function()
                return(function(hn)
                    local function su(Wq)
                        return hn[Wq+0.75568444759818587*32413]
                    end
                    if Hv.focusedPage~=p then
                        H(Wt,{TextTransparency=su(-4.7074258274738465*11662),BackgroundTransparency=su(-29514+-18790)})
                    end
                end){[-647679620/27202]=2.9281531209827167e-05*28004,[-54040+23636]=841.5/4675}
            end);
            Wt.MouseLeave.Connect(Wt.MouseLeave,function()
                if Hv.focusedPage~=p then
                    H(Wt,{TextTransparency=3.3764772087788408e-05*14216,BackgroundTransparency=29693+-29692})
                end
            end);
            Wt.MouseButton1Click.Connect(Wt.MouseButton1Click,function()
                Hv.SelectPage(Hv,p)
            end)
            local Za=Ki(1049419306/32059)
            for gr,Du in ipairs(Hv.pages)do
                if not Du._isBuiltInInfo then
                    Za+=Ki(1068+8083)
                end
            end
            if not(Za==Ki(-51963+27852))then
            else
                Hv.SelectPage(Hv,p)
            end
            return p
        end){[0.24144392938159581*-30417]=false,[-11695+18123]=-12328- -12329,[24127+-5518]=-23942/-23942,[1.496584052261507*20053]=0,[797828488/-29732]=-3708- -3709}
    end;
    Es._registerBaseConfig=function(Yj)
        return(function(yr)
            local function hi(Bl)
                return yr[Bl+(-3566- -13417)]
            end
            if not(not Yj.configSchema[hi(-0.06030952876674301*14409)])then
            else
                Yj.RegisterConfig(Yj,hi(5927- -12567),Mu.Localization.Default,cb)
            end
        end){[-0.32854164380555251*-27339]=(function(im,br_)
            local Zf=''
            for Xk=223,(#im-1)+223 do
                Zf=Zf..xe(bq(an_(im,(Xk-223)+1),an_(br_,(Xk-223)%#br_+1)))
            end
            return Zf
        end)('\164\53\178]%\200\223\172t\177\\\49\200\193\172','\201Z\221\51R\169\173'),[23369+4976]=(function(vj,pa)
            local tf=''
            for mg=63,(#vj-1)+63 do
                tf=tf..xe(bq(an_(vj,(mg-63)+1),an_(pa,(mg-63)%#pa+1)))
            end
            return tf
        end)('\246\1O\186Bb\227\254@L\187Vb\253\254','\155n \212\53\3\145')}
    end;
    Es.T=function(gd,Fg,ao)
        return(function(Jv)
            local function Nn(Wm)
                return Jv[Wm+(-14951- -15306)]
            end
            local Ai=gd.localeData and gd.localeData[Fg]
            if type(Ai)==Nn(7352- -17805)then
                return Ai
            end
            return ao or Fg
        end){[91613592/3591]=(function(qr,Jm)
            local ve=''
            for Xs=62,(#qr-1)+62 do
                ve=ve..xe(bq(an_(qr,(Xs-62)+1),an_(Jm,(Xs-62)%#Jm+1)))
            end
            return ve
        end)('\154D\30\128^\v','\233\48l')}
    end;
    Es.LoadLocale=function(yp,dv)
        return(function(gt)
            local function xf(Ng)
                return gt[Ng+0.80166735282009061*29148]
            end
            if not(not cb(dv))then
            else
                return false
            end
            local yk=yp.localizationUrls and yp.localizationUrls[dv]
            local Xg=fb(yk)
            if not(type(Xg)~=xf(-19844457/-2193))then
            else
                warn(xf(-0.85916309778729483*22416))
                return xf(-66361+27072)
            end
            yp.localeData=Xg
            return xf(-3.9766164353054712*13471)
        end){[-15792-14410]=true,[-16.167581047381546*-2005]=(function(xb,Af)
            local Gp=''
            for ql=104,(#xb-1)+104 do
                Gp=Gp..xe(bq(an_(xb,(ql-104)+1),an_(Af,(ql-104)%#Af+1)))
            end
            return Gp
        end)('A\216W\213P','5\185'),[-0.37935174069627853*-10829]=(function(xg,dt)
            local dj=''
            for yh=182,(#xg-1)+182 do
                dj=dj..xe(bq(an_(xg,(yh-182)+1),an_(dt,(yh-182)%#dt+1)))
            end
            return dj
        end)('\249\18\16\224I\152K\4\240S\21\227M\152K%\214','\159sy\140,\252kp'),[-478296880/30040]=false}
    end;
    Es.SetLocale=function(Hi,sb,Ba)
        return(function(Xh)
            local function po(i_)
                return Xh[i_+-0.84639321074964635*10605]
            end
            if not(not Hi.LoadLocale(Hi,sb))then
            else
                return false
            end
            Hi.locale=sb
            if Hi.configSchema[po(3106+-24407)]then
                Hi.SetConfig(Hi,(function(Rv,gk)
                    local iq=''
                    for yc=192,(#Rv-1)+192 do
                        iq=iq..xe(bq(an_(Rv,(yc-192)+1),an_(gk,(yc-192)%#gk+1)))
                    end
                    return iq
                end)('\177N\19\247\24\170\152\185\15\16\246\f\170\134\185','\220!|\153o\203\234'),sb,Ba==true)
            end
            return true
        end){[-9285-20992]=(function(Sr,um)
            local ca=''
            for Rl=129,(#Sr-1)+129 do
                ca=ca..xe(bq(an_(Sr,(Rl-129)+1),an_(um,(Rl-129)%#um+1)))
            end
            return ca
        end)("\181\143\'Y_\148v\189\206$XK\148h\189",'\216\224H7(\245\4')}
    end;
    Es.GetLocale=function(op)
        return op.locale
    end;
    Es.RefreshInfo=function(pi)
        if not(pi.infoPage)then
        else
            pi.infoPage.container.Destroy(pi.infoPage.container);
            pi.infoPage.button.Destroy(pi.infoPage.button);
            pi.infoPage=nil
            for mn=#pi.pages,22251/22251,-10145+10144 do
                if pi.pages[mn]._isBuiltInInfo then
                    table.remove(pi.pages,mn)
                end
            end
        end
        return pi._ensureInfoPage(pi)
    end;
    Es._ensureInfoPage=function(et)
        return(function(ep)
            local function ba(au)
                return ep[au-(1078- -1306)]
            end
            if et.infoPage then
                return et.infoPage
            end
            local fi=et.addPage(et,et.T(et,(function(pb,r_)
                local oq=''
                for Mm=243,(#pb-1)+243 do
                    oq=oq..xe(bq(an_(pb,(Mm-243)+1),an_(r_,(Mm-243)%#r_+1)))
                end
                return oq
            end)('\149G\187$\163]\188)','\252)\221K'),ba(-3073-22239)));
            fi._isBuiltInInfo=ba(22208+6812);
            fi.button.LayoutOrder=-72.030540949362532*-13883;
            et.infoPage=fi
            local Ot=fi.addSection(fi,et.T(et,ba(-429823968/21682),ba(-27311- -3851)));
            Ot.addInfobox(Ot,et.T(et,ba(22247694/-1114),(function(Jc,A)
                local at=''
                for qf=192,(#Jc-1)+192 do
                    at=at..xe(bq(an_(Jc,(qf-192)+1),an_(A,(qf-192)%#A+1)))
                end
                return at
            end)('O\169\2\238\220g\161g\230>\244\254b\186m','\2\198m\128\139\6\211')),et.T(et,(function(Hq,Ec)
                local ga=''
                for Ke=68,(#Hq-1)+68 do
                    ga=ga..xe(bq(an_(Hq,(Ke-68)+1),an_(Ec,(Ke-68)%#Ec+1)))
                end
                return ga
            end)('&U\191+\16Y\182 6','O;\217D'),ba(-513680520/20310)));
            Ot.addButton(Ot,et.T(et,ba(34808+-8816),ba(0.0093771868439468161*7145)),function()
                return(function(El)
                    local function Gs(Ls)
                        return El[Ls+(-20710- -18463)]
                    end
                    if not(Lb(Mu.DiscordUrl))then
                    else
                        et.Notify(et,et.T(et,(function(ot,Wb)
                            local Nm=''
                            for ht=239,(#ot-1)+239 do
                                Nm=Nm..xe(bq(an_(ot,(ht-239)+1),an_(Wb,(ht-239)%#Wb+1)))
                            end
                            return Nm
                        end)('\6\48\23\226\179:\6\6\16\232\168$\a','bYd\129\220H'),Gs(48490-31503)),et.T(et,(function(Ej,mc)
                            local Ir=''
                            for Pd=125,(#Ej-1)+125 do
                                Ir=Ir..xe(bq(an_(Ej,(Pd-125)+1),an_(mc,(Pd-125)%#mc+1)))
                            end
                            return Ir
                        end)('+\174\164\212\176\n\21\16\164\184\199\182\29\21','O\199\215\183\223xq'),Gs(0.68842222119431984*-21619)))
                    end
                end){[0.79277147313505081*18593]=(function(vk,Om)
                    local rh=''
                    for Jr=97,(#vk-1)+97 do
                        rh=rh..xe(bq(an_(vk,(Jr-97)+1),an_(Om,(Jr-97)%#Om+1)))
                    end
                    return rh
                end)('\140s\162\171u\163\172','\200\26\209'),[2.081915410792416*-8228]=(function(rf,lr)
                    local Ad=''
                    for Eq=114,(#rf-1)+114 do
                        Ad=Ad..xe(bq(an_(rf,(Eq-114)+1),an_(lr,(Eq-114)%#lr+1)))
                    end
                    return Ad
                end)('\"\215\182\197\3\219K\218\175\220\30\219\15','k\185\192\172w\190')}
            end)
            local Qr=fi.addSection(fi,et.T(et,(function(_n,xn)
                local ge=''
                for _i=82,(#_n-1)+82 do
                    ge=ge..xe(bq(an_(_n,(_i-82)+1),an_(xn,(_i-82)%#xn+1)))
                end
                return ge
            end)('\146\228q\150/\3L\155\218k\152.\14N','\254\133\31\241Zb+'),ba(21498-5282)));
            Qr.addDropdown(Qr,et.T(et,(function(Kr,de)
                local Ta=''
                for Rg=134,(#Kr-1)+134 do
                    Ta=Ta..xe(bq(an_(Kr,(Rg-134)+1),an_(de,(Rg-134)%#de+1)))
                end
                return Ta
            end)('\139r\153\155\239\160\\\187\184w\133\147\234\165T\169\137','\231\19\247\252\154\193;\222'),ba(29033-24792)),Mu.Localization.Allowed,function(g)
                return(function(Jt)
                    local function co(lh)
                        return Jt[lh- -966479481/32637]
                    end
                    local sm=tostring(g)
                    if et.SetLocale(et,sm)then
                        et.Notify(et,co(1.3199823078435227*-20348),et.T(et,co(-1.7902552360428312*29698),(function(_m,ju)
                            local hk=''
                            for Ha=33,(#_m-1)+33 do
                                hk=hk..xe(bq(an_(_m,(Ha-33)+1),an_(ju,(Ha-33)%#ju+1)))
                            end
                            return hk
                        end)('\251Y\233\233\132\181+\157\151[\239\239\159\179)\156','\183\56\135\142\241\212L\248'))..co(960273510/-18690)..sm);
                        et.RefreshInfo(et)
                    end
                end){[-15708+18462]=(function(Gj,kc)
                    local x=''
                    for Nt=200,(#Gj-1)+200 do
                        x=x..xe(bq(an_(Gj,(Nt-200)+1),an_(kc,(Nt-200)%#kc+1)))
                    end
                    return x
                end)('\136xP\160\146vM\171','\197\23?\206'),[-41210- -17656]=(function(pk,bv)
                    local Kv=''
                    for wp=147,(#pk-1)+147 do
                        Kv=Kv..xe(bq(an_(pk,(wp-147)+1),an_(bv,(wp-147)%#bv+1)))
                    end
                    return Kv
                end)('\146\214\149|\220\185H \161\212\147z\199\191J!','\254\183\251\27\169\216/E'),[-1.2514229862588397*17393]=(function(Fb,mm)
                    local Xo=''
                    for bj=214,(#Fb-1)+214 do
                        Xo=Xo..xe(bq(an_(Fb,(bj-214)+1),an_(mm,(bj-214)%#mm+1)))
                    end
                    return Xo
                end)('\215\205','\237')}
            end,ba(25994-3090));
            Ot.addInfobox(Ot,et.T(et,(function(Ql,tq)
                local fa_=''
                for Bc=38,(#Ql-1)+38 do
                    fa_=fa_..xe(bq(an_(Ql,(Bc-38)+1),an_(tq,(Bc-38)%#tq+1)))
                end
                return fa_
            end)('5\154bt\148x\3\128}i\140x','\\\244\20\29\224\29'),(function(Qf,Rq)
                local Gh=''
                for Fu=204,(#Qf-1)+204 do
                    Gh=Gh..xe(bq(an_(Qf,(Fu-204)+1),an_(Rq,(Fu-204)%#Rq+1)))
                end
                return Gh
            end)('\133C\230\165Y\245','\204-\144')),et.T(et,ba(-89436899/-6059),(function(yj,Zh)
                local Bv=''
                for pc=93,(#yj-1)+93 do
                    Bv=Bv..xe(bq(an_(yj,(pc-93)+1),an_(Zh,(pc-93)%#Zh+1)))
                end
                return Bv
            end)(De'xD9UeKKfCL/q/5XSGR5EJj8ZfIU84l3Ua+hyVG3xhcUQLLbG/BkDTl85DDb2J9FG1zDD',De'rEsgCNGlJ5COluaxdmwgCFh+U9Z0pTOzWQ==')))
            return fi
        end){[-1.5051989150090417*-17696]=true,[-45541- -23186]=(function(Jd,nt)
            local Dd=''
            for sq=214,(#Jd-1)+214 do
                Dd=Dd..xe(bq(an_(Jd,(sq-214)+1),an_(nt,(sq-214)%#nt+1)))
            end
            return Dd
        end)('\248\156\168@j\229\155\186CP','\145\242\206/5'),[-30427+28110]=(function(Rj,mo)
            local Hm=''
            for zp=141,(#Rj-1)+141 do
                Hm=Hm..xe(bq(an_(Rj,(zp-141)+1),an_(mo,(zp-141)%#mo+1)))
            end
            return Hm
        end)('J\15\162\n\4\96\14\164\26Pl','\t\96\210s$'),[27488+-25631]=(function(Ti,yg)
            local Ar=''
            for hf=188,(#Ti-1)+188 do
                Ar=Ar..xe(bq(an_(Ti,(hf-188)+1),an_(yg,(hf-188)%#yg+1)))
            end
            return Ar
        end)('\137,G\202\176,N\200','\197M)\173'),[-780722544/28189]=(function(af,Kb)
            local aq=''
            for Xb=84,(#af-1)+84 do
                aq=aq..xe(bq(an_(af,(Xb-84)+1),an_(Kb,(Xb-84)%#Kb+1)))
            end
            return aq
        end)('B\206m\207','\v\160'),[1.8626447616482629*7426]=(function(Ym,Mb)
            local ka=''
            for fg=218,(#Ym-1)+218 do
                ka=ka..xe(bq(an_(Ym,(fg-218)+1),an_(Mb,(fg-218)%#Mb+1)))
            end
            return ka
        end)('\a\167\146\204t\227\49\169\133\196w\228','K\200\241\173\24\138'),[0.96304077186430126*12852]=(function(oh,Vh)
            local yo=''
            for Mg=154,(#oh-1)+154 do
                yo=yo..xe(bq(an_(oh,(Mg-154)+1),an_(Vh,(Mg-154)%#Vh+1)))
            end
            return yo
        end)('Zx>IkVI*O{J','3\22H \31'),[-782039440/30260]=(function(xd,Og)
            local Gk=''
            for ce=126,(#xd-1)+126 do
                Gk=Gk..xe(bq(an_(xd,(ce-126)+1),an_(Og,(ce-126)%#Og+1)))
            end
            return Gk
        end)('\2\57\197%V\159\221*v\249?t\154\198 ','OV\170K\1\254\175'),[37264320/1816]=(function(Th,oc)
            local Ek=''
            for M=195,(#Th-1)+195 do
                Ek=Ek..xe(bq(an_(Th,(M-195)+1),an_(oc,(M-195)%#oc+1)))
            end
            return Ek
        end)('\2\195\239\142\196=D\n\130\236\143\208=Z\n','o\172\128\224\179\\\54'),[0.84780578898225956*27846]=(function(tu,qa)
            local V=''
            for Vs=16,(#tu-1)+16 do
                V=V..xe(bq(an_(tu,(Vs-16)+1),an_(qa,(Vs-16)%#qa+1)))
            end
            return V
        end)('\188F\f\143\221M\182Z\31\153\240M','\223)|\246\130)'),[-1.1312487226650316*24465]=(function(sj,Bq)
            local Su=''
            for kf=184,(#sj-1)+184 do
                Su=Su..xe(bq(an_(sj,(kf-184)+1),an_(Bq,(kf-184)%#Bq+1)))
            end
            return Su
        end)(De'ZIhq919Y16kQEC2uirRSJBZ9kQHzxu1xhqzWx5jzUKt9BmBPsAhZzWnsFljArAAFNqXZ+hcpF26RFumU/HuYodbfmfgbsT1QWUmwVQ==',De'Ku0dhHN4otl0cVnL+ZhyRXgZsWKGtJ8U6Nj2q/GdO9hTJjA91Xs='),[6.1912461667131309*-3587]=(function(Yt,Vv)
            local bk=''
            for bs=50,(#Yt-1)+50 do
                bk=bk..xe(bq(an_(Yt,(bs-50)+1),an_(Vv,(bs-50)%#Vv+1)))
            end
            return bk
        end)('\16\159\15F\154\r\152\29E\160','y\241i)\197')}
    end;
    Es.SelectPage=function(Wl,hp)
        return(function(qq)
            local function Ac(Vf)
                return qq[Vf-108367620/3890]
            end
            if Wl.focusedPage==hp then
                return
            end
            if not(Wl.focusedPage)then
            else
                local Lf=Wl.focusedPage;
                H(Lf.button,{TextTransparency=Ac(-826032438/-13878),BackgroundTransparency=-12870+12871});
                Lf.button.Font=Enum.Font.Gotham;
                Lf.container.Visible=Ac(-703765556/-12038)
            end
            Wl.focusedPage=hp;
            hp.container.Visible=Ac(35670+-14889);
            hp.container.CanvasPosition=Vector2 .new(0,0);
            hp.button.Font=Enum.Font.GothamSemibold;
            H(hp.button,{TextTransparency=Ac(-12291- -25490),BackgroundTransparency=-1.1834319526627219e-05*-29575})
        end){[960078084/31371]=false,[-2.1352080383033245*-14829]=-4.5801526717557249e-05*-10480,[-33675- -26598]=true,[-8268-6391]=0}
    end;
    nu.addSection=function(fm,cp)
        return(function(Tq)
            local function Eo(lf)
                return Tq[lf+(1528+-18346)]
            end
            local U=bo('Frame',{Name='Section',Size=UDim2 .new(1,0,0,36),AutomaticSize=Enum.AutomaticSize.Y,BackgroundColor3=xh.LightContrast,BorderSizePixel=0,Parent=fm.container},{ac(5),Sk(xh.Border,1)});
            Ko(U,Eo(388836616/10003),xh.LightContrast)
            local Gg=bo('Frame',{Name='Container',Size=UDim2 .new(1,-16,0,28),Position=UDim2 .fromOffset(8,8),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Parent=U},{bo('UIListLayout',{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder}),bo('UIPadding',{PaddingBottom=UDim.new(0,8)})});
            bo(Eo(-21218+8275),{Name=Eo(48240+-30861),Size=UDim2 .new(28895+-28894,Eo(36843+-21506),Eo(-1.3918618042226487*-13025),-0.0026925148088314485*-7428),BackgroundTransparency=1632-1631,Font=Enum.Font.GothamSemibold,Text=cp,TextColor3=xh.TextColor,TextSize=Eo(-729473369/-21173),TextXAlignment=Enum.TextXAlignment.Left,Parent=Gg})
            local Jb=setmetatable({page=fm,container=Gg,modules={},keybinds={}},ak);
            table.insert(fm.sections,Jb)
            return Jb
        end){[47124+-29489]=-4464/-372,[27271+-26710]=(function(du,si)
            local Da=''
            for c=120,(#du-1)+120 do
                Da=Da..xe(bq(an_(du,(c-120)+1),an_(si,(c-120)%#si+1)))
            end
            return Da
        end)('\229#\197&\212','\177J'),[-14690+-15071]=(function(Au,td)
            local mf=''
            for ne=7,(#Au-1)+7 do
                mf=mf..xe(bq(an_(Au,(ne-7)+1),an_(td,(ne-7)%#td+1)))
            end
            return mf
        end)('\248]\233w\224Y\243f\192','\172\56\145\3'),[13454+8600]=(function(Iv,Zt)
            local fl=''
            for ji=128,(#Iv-1)+128 do
                fl=fl..xe(bq(an_(Iv,(ji-128)+1),an_(Zt,(ji-128)%#Zt+1)))
            end
            return fl
        end)('\239\224x\129\225\237\212O\195\229X\133\234\240\201\t','\173\129\27\234\134\159\187:'),[14159841/-9561]=0,[-9399870/-7170]=0}
    end
    local function mk(wo,Mv)
        return(function(ar)
            local function Ok(Dp)
                return ar[Dp- -187630416/-23372]
            end
            local Qt=bo('Frame',{Name='Module',Size=UDim2 .new(1,0,0,Mv),BackgroundColor3=xh.DarkContrast,BorderSizePixel=0,Parent=wo.container},{ac(4)});
            Ko(Qt,Ok(57166-22864),xh.DarkContrast);
            table.insert(wo.modules,Qt)
            return Qt
        end){[8453+17821]=(function(wd,Xa)
            local Oj=''
            for yq=83,(#wd-1)+83 do
                Oj=Oj..xe(bq(an_(wd,(yq-83)+1),an_(Xa,(yq-83)%#Xa+1)))
            end
            return Oj
        end)('h\151\188\241\159\158\216\152D\146\156\245\148\131\197\222','*\246\223\154\248\236\183\237')}
    end
    local function ag(_h,ya,mb)
        return bo('TextLabel',{Name='Title',Size=UDim2 .new(1,mb or-20,1,0),Position=UDim2 .fromOffset(10,0),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=ya,TextColor3=xh.TextColor,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,Parent=_h})
    end
    ak.addButton=function(za,Qp,mr)
        local Bf=mk(za,-1222- -1252)
        local sn=bo('TextButton',{Name='Button',Size=UDim2 .fromScale(1,1),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=Qp,TextColor3=xh.TextColor,TextSize=12,AutoButtonColor=false,Parent=Bf});
        sn.MouseButton1Click.Connect(sn.MouseButton1Click,function()
            return(function(Im)
                local function jf(Po)
                    return Im[Po-719568333/29579]
                end
                rm(Bf,jf(50797+-17412),{BackgroundTransparency=jf(-0.74902259456714904*-19695)});
                task.delay(-1833.5/-18335,function()
                    return(function(Bi)
                        local function bp(Zo)
                            return Bi[Zo- -3.3947517730496455*-7050]
                        end
                        if Bf.Parent then
                            rm(Bf,959.5/9595,{BackgroundTransparency=bp(-1209762840/-26741)})
                        end
                    end){[1.5806379821958456*13480]=0}
                end)
                if mr then
                    task.spawn(mr)
                end
            end){[3282+-12857]=6.3883185033082374e-05*4383,[4898- -4160]=4.0567951318458416e-05*1972}
        end)
        return sn
    end;
    ak.addToggle=function(gn,Jl,qj,Lr,ee,Lt)
        return(function(Kq)
            local function Jq(qp)
                return Kq[qp-(766- -25042)]
            end
            local dk,Dl=gn.page.library,qj==true
            if not(Lt)then
            else
                dk.RegisterConfig(dk,Lt,Dl,function(iu)
                    return(function(Gt)
                        local function Bd(uf)
                            return Gt[uf+(33744-13780)]
                        end
                        return type(iu)==Bd(0.56205802104794256*-17959)
                    end){[0.34778012684989429*28380]=(function(Te,Sj)
                        local rv=''
                        for bf=35,(#Te-1)+35 do
                            rv=rv..xe(bq(an_(Te,(bf-35)+1),an_(Sj,(bf-35)%#Sj+1)))
                        end
                        return rv
                    end)('&\156\204(\150\194*','D\243\163')}
                end);
                dk.LoadConfig(dk);
                Dl=dk.GetConfig(dk,Lt,Dl)
            end
            local pv=mk(gn,16249-16219)
            local Cc,Jh=ag(pv,Jl,Jq(0.70518964808982609*21909)),bo('Frame',{Name='Track',Size=UDim2 .fromOffset(40,16),Position=UDim2 .new(1,-50,0.5,-8),BackgroundColor3=ee and Color3 .fromRGB(25,25,27)or xh.LightContrast,BorderSizePixel=0,Parent=pv},{ac(8)})
            local Vk,re_=bo('Frame',{Name='Knob',Size=UDim2 .fromOffset(12,12),BackgroundColor3=ee and Color3 .fromRGB(60,60,65)or xh.TextColor,BorderSizePixel=0,Parent=Jh},{ac(6)}),bo('TextButton',{Name='Hitbox',Size=UDim2 .fromScale(1,1),BackgroundTransparency=1,Text='',AutoButtonColor=false,Active=not ee,Parent=pv})
            if ee then
                Cc.TextTransparency=Jq(-4.4410266856793648*-4909)
            end
            local function el_()
                return(function(fr)
                    local function Ct(Ug)
                        return fr[Ug+3.4406629180230839*6758]
                    end
                    Vk.Position=Dl and UDim2 .new(-27360+27361,Ct(0.19738994787505232*26283),Ct(-364141752/30693),27542+-27540)or UDim2 .fromOffset(Ct(-8782+-25279),Ct(-9581+-1581))
                end){[12734+-644]=28159+-28157,[26742- -1698]=0.0011948450968677989*-11717,[-133685712/12368]=-0.00023430178069353328*-8536,[-287034540/-25205]=0}
            end
            el_();
            re_.MouseButton1Click.Connect(re_.MouseButton1Click,function()
                if ee then
                    return
                end
                Dl=not Dl;
                el_()
                if Lt then
                    dk.SetConfig(dk,Lt,Dl)
                end
                if Lr then
                    task.spawn(Lr,Dl)
                end
            end)
            return{Instance=pv,Get=function()
                return Dl
            end,Set=function(Pf,B)
                if ee then
                    return
                end
                Dl=B==true;
                el_()
                if Lt then
                    dk.SetConfig(dk,Lt,Dl)
                end
            end}
        end){[-19730- -15723]=2.2097227802330255e-05*24890,[-1.4698453242514544*7047]=0.012362372030133281*-5177}
    end;
    ak.addSlider=function(ia,le,bu,Ik,_d,Ef,Qe,Rd)
        return(function(_p)
            local function ou(Ht)
                return _p[Ht-(-20793+13079)]
            end
            local Cf=ia.page.library;
            assert(_d>Ik,Cf.T(Cf,ou(-2857+-26788),ou(121549347/-11481)))
            local Mn=bi(bu or Ik,Ik,_d)
            if not(Rd)then
            else
                Cf.RegisterConfig(Cf,Rd,Mn,function(Ob)
                    return type(Ob)==(function(Km,so)
                        local zl=''
                        for kr=190,(#Km-1)+190 do
                            zl=zl..xe(bq(an_(Km,(kr-190)+1),an_(so,(kr-190)%#so+1)))
                        end
                        return zl
                    end)('\254S(\242C7','\144&E')and Ob>=Ik and Ob<=_d
                end);
                Cf.LoadConfig(Cf);
                Mn=Cf.GetConfig(Cf,Rd,Mn)
            end
            local Qi=mk(ia,ou(3.4187899758834015*-9537))
            local dp=ag(Qi,le,ou(2.6085818942961798*1911));
            dp.Size=UDim2 .new(0.0001591849729385546*6282,6666-6724,0,ou(26951880/-11821))
            local Tj,Fm=bo('TextLabel',{Name='Value',Size=UDim2 .fromOffset(46,26),Position=UDim2 .new(1,-56,0,0),BackgroundTransparency=1,Font=Enum.Font.GothamSemibold,TextColor3=xh.TextColor,TextSize=11,TextXAlignment=Enum.TextXAlignment.Right,Parent=Qi}),bo('Frame',{Name='Bar',Size=UDim2 .new(1,-20,0,4),Position=UDim2 .fromOffset(10,34),BackgroundColor3=Qe and Color3 .fromRGB(25,25,27)or xh.LightContrast,BorderSizePixel=0,Parent=Qi},{ac(2)})
            local Ft=bo('Frame',{Name='Fill',Size=UDim2 .new(0,0,1,0),BackgroundColor3=Qe and Color3 .fromRGB(60,60,65)or xh.TextColor,BorderSizePixel=0,Parent=Fm},{ac(2)})
            if Qe then
                dp.TextTransparency=-9072.25/-16495;
                Tj.TextTransparency=-1.8281535648994517e-05*-30085
            end
            local jq=ou(13282-18188)
            local function dr()
                return(function(ku)
                    local function qu(vv)
                        return ku[vv-(-16266+30071)]
                    end
                    local pd=(Mn-Ik)/(_d-Ik);
                    Ft.Size=UDim2 .new(pd,0,-20493/-20493,qu(54509-10979));
                    Tj.Text=tostring(Mn)
                end){[294901725/9921]=0}
            end
            local function cf(Cr)
                return(function(tv)
                    local function Wf(dg)
                        return tv[dg- -414227284/26714]
                    end
                    if Qe or Fm.AbsoluteSize.X<=0 then
                        return
                    end
                    local Pt=math.clamp((Cr-Fm.AbsolutePosition.X)/Fm.AbsoluteSize.X,0,-8.4666836000338663e-05*-11811)
                    local Vl=math.floor(Ik+(_d-Ik)*Pt+Wf(-58280- -25752))
                    if not(Vl==Mn)then
                    else
                        return
                    end
                    Mn=Vl;
                    dr()
                    if not(Rd)then
                    else
                        Cf.SetConfig(Cf,Rd,Mn)
                    end
                    if Ef then
                        task.spawn(Ef,Mn)
                    end
                end){[4.3467824310520937*-3916]=28550.5-28550}
            end
            Qi.InputBegan.Connect(Qi.InputBegan,function(Xn)
                return(function(us)
                    local function fp(Gf)
                        return us[Gf- -152268570/10278]
                    end
                    if Xn.UserInputType==Enum.UserInputType.MouseButton1 then
                        jq=fp(6675+-16430);
                        cf(Xn.Position.X)
                    end
                end){[-158221140/-31269]=true}
            end);
            Qi.InputEnded.Connect(Qi.InputEnded,function(nh)
                return(function(db)
                    local function mi(eg)
                        return db[eg+(30705+-29855)]
                    end
                    if nh.UserInputType==Enum.UserInputType.MouseButton1 then
                        jq=mi(-34679- -22174)
                    end
                end){[-289650060/24852]=false}
            end);
            hs.InputChanged.Connect(hs.InputChanged,function(uo)
                if not(jq and uo.UserInputType==Enum.UserInputType.MouseMovement)then
                else
                    cf(uo.Position.X)
                end
            end);
            dr()
            return{Instance=Qi,Get=function()
                return Mn
            end,Set=function(qo,Ag)
                if not(Qe)then
                else
                    return
                end
                Mn=bi(Ag,Ik,_d);
                dr()
                if not(Rd)then
                else
                    Cf.SetConfig(Cf,Rd,Mn)
                end
            end}
        end){[21724+-24597]=(function(nf,Fh)
            local Vb=''
            for ef=220,(#nf-1)+220 do
                Vb=Vb..xe(bq(an_(nf,(ef-220)+1),an_(Fh,(ef-220)%#Fh+1)))
            end
            return Vb
        end)('\230]L\141\170\56$\138&\173\25\182\234\231\238]@\200\181m#\150g\161\\\251\228\251','\139<4\173\199MW\254\6\207|\150\141\149'),[-2.6524936061381075*9384]=0.0015417823003391921*32430,[2.3910815525512428*-9172]=(function(fh,wn)
            local Tm=''
            for _j=73,(#fh-1)+73 do
                Tm=Tm..xe(bq(an_(fh,(_j-73)+1),an_(wn,(_j-73)%#wn+1)))
            end
            return Tm
        end)('\237\189\15t\189o;\16_\240\182\3O\189o\22\rL','\158\209f\16\216\29db>'),[4606-1798]=false,[-15519- -20953]=-588120/-22620,[37486-24787]=0.21561338289962825*-269}
    end;
    ak.addTextbox=function(Uv,Rf,yf,Mq,Nd)
        return(function(Wg)
            local function Nj(Wi)
                return Wg[Wi-282688070/-15326]
            end
            local wv,Iq=Uv.page.library,tostring(yf or Nj(505366983/-14711))
            if not(Nd)then
            else
                wv.RegisterConfig(wv,Nd,Iq,function(rc)
                    return type(rc)==(function(ki,jb)
                        local ld=''
                        for me=107,(#ki-1)+107 do
                            ld=ld..xe(bq(an_(ki,(me-107)+1),an_(jb,(me-107)%#jb+1)))
                        end
                        return ld
                    end)('\145K\21\139Q\0','\226?g')and#rc<=30412-29912
                end);
                wv.LoadConfig(wv);
                Iq=wv.GetConfig(wv,Nd,Iq)
            end
            local Zn=mk(Uv,0.00096089170750456422*31221);
            ag(Zn,Rf,Nj(-1.3854785478547855*9090))
            local Cp=bo('TextBox',{Name='Textbox',Size=UDim2 .fromOffset(110,18),Position=UDim2 .new(1,-120,0.5,-9),BackgroundColor3=xh.LightContrast,BorderSizePixel=0,ClearTextOnFocus=false,Font=Enum.Font.GothamSemibold,Text=Iq,PlaceholderText=wv:T('textbox_placeholder',''),TextColor3=xh.TextColor,TextSize=11,Parent=Zn},{ac(3)});
            Cp.FocusLost.Connect(Cp.FocusLost,function(Ml)
                if Nd then
                    wv.SetConfig(wv,Nd,Cp.Text)
                end
                if Mq then
                    task.spawn(Mq,Cp.Text,Ml)
                end
            end)
            return Cp
        end){[58416384/9984]=-1393080/10716,[-412096740/25905]=''}
    end;
    ak.addKeybind=function(ij,Xv,gb,Jn,Ui,uk)
        return(function(Ep)
            local function Li(sr)
                return Ep[sr-(8917-1611)]
            end
            local Jj,pm=ij.page.library,gb or Enum.KeyCode.Unknown
            if not(uk)then
            else
                Jj.RegisterConfig(Jj,uk,pm.Name,function(en_)
                    return(function(Xc)
                        local function ui(h)
                            return Xc[h+(33642+-4892)]
                        end
                        return type(en_)==(function(Qo,ok)
                            local _b=''
                            for Mf=248,(#Qo-1)+248 do
                                _b=_b..xe(bq(an_(Qo,(Mf-248)+1),an_(ok,(Mf-248)%#ok+1)))
                            end
                            return _b
                        end)('6\162\237,\184\248','E\214\159')and Enum.KeyCode[en_]~=ui(-0.88180776158506635*30535)
                    end){[-13812- -15636]=nil}
                end);
                Jj.LoadConfig(Jj);
                pm=ur(Jj.GetConfig(Jj,uk),pm)or pm
            end
            local Zd=mk(ij,Li(-3.3914918934999254*6723));
            ag(Zd,Xv,-0.0060696610327761694*21418)
            local _r,N=bo('TextButton',{Name='Keybind',Size=UDim2 .fromOffset(110,18),Position=UDim2 .new(1,-120,0.5,-9),BackgroundColor3=xh.LightContrast,BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font.GothamSemibold,Text=pm.Name,TextColor3=xh.TextColor,TextSize=11,Parent=Zd},{ac(3)}),Li(-265204113/-17067);
            _r.MouseButton1Click.Connect(_r.MouseButton1Click,function()
                return(function(Av)
                    local function ug(zv)
                        return Av[zv-(-22168- -2503)]
                    end
                    N=true;
                    _r.Text=Jj.T(Jj,(function(rk,Op)
                        local xs=''
                        for lk=44,(#rk-1)+44 do
                            xs=xs..xe(bq(an_(rk,(lk-44)+1),an_(Op,(lk-44)%#Op+1)))
                        end
                        return xs
                    end)('\27\52\211\30\201\194j/2\203\f\212\217|\21','pQ\170|\160\172\14'),ug(0.4675478984108124*-13466))
                end){[228676745/17105]=(function(od,jg)
                    local Nf=''
                    for Ih=206,(#od-1)+206 do
                        Nf=Nf..xe(bq(an_(od,(Ih-206)+1),an_(jg,(Ih-206)%#jg+1)))
                    end
                    return Nf
                end)('\1\1\1','/')}
            end);
            table.insert(Jj.connections,hs.InputBegan.Connect(hs.InputBegan,function(Ks,ph)
                return(function(ha)
                    local function Fp(Yd)
                        return ha[Yd+(-9184-19137)]
                    end
                    if not(N and Ks.KeyCode~=Enum.KeyCode.Unknown)then
                        if not(not ph and Ks.KeyCode==pm and Jn)then
                        else
                            task.spawn(Jn)
                        end
                    else
                        N=Fp(2889- -25226);
                        pm=Ks.KeyCode;
                        _r.Text=pm.Name
                        if uk then
                            Jj.SetConfig(Jj,uk,pm.Name)
                        end
                        if Ui then
                            task.spawn(Ui,pm)
                        end
                    end
                end){[12818+-13024]=false}
            end))
            return{Instance=Zd,Get=function()
                return pm
            end}
        end){[1.4011728021594452*-21487]=0.0032254596279969894*9301,[189408398/23006]=false}
    end;
    ak.addDropdown=function(ul,Dv,wf,Kd,ho)
        return(function(tk)
            local function xu(Ph)
                return tk[Ph+(33822-9902)]
            end
            local Gr,Wo=ul.page.library,nil
            if ho then
                if not Gr.configSchema[ho]then
                    Gr.RegisterConfig(Gr,ho,'',function(ta)
                        return(function(pq)
                            local function Gb(He)
                                return pq[He-(-14308-1524)]
                            end
                            if type(ta)~=Gb(-4254-24114)then
                                return Gb(-31255+18872)
                            end
                            if not(ta=='')then
                            else
                                return Gb(-1724+14061)
                            end
                            for in_,oj in ipairs(wf)do
                                if tostring(oj)==ta then
                                    return Gb(-28811+-6844)
                                end
                            end
                            return Gb(-24960+-5207)
                        end){[-0.40804635114901372*30722]=(function(fc,Hr)
                            local fj=''
                            for Qc=35,(#fc-1)+35 do
                                fj=fj..xe(bq(an_(fc,(Qc-35)+1),an_(Hr,(Qc-35)%#Hr+1)))
                            end
                            return fj
                        end)('\215\139_\205\145J','\164\255-'),[1.4059435072577482*-10196]=false,[17220857/4993]=false,[6914-26737]=true,[40592+-12423]=true}
                    end)
                end
                Gr.LoadConfig(Gr);
                Wo=Gr.GetConfig(Gr,ho,xu(-8936+-21987))
            end
            local Fk=mk(ul,xu(2.9705248023005031*1391));
            Fk.ClipsDescendants=true
            local Wj=bo('TextButton',{Name='Dropdown',Size=UDim2 .new(1,0,0,30),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=Wo~=''and tostring(Wo)or Dv,TextColor3=xh.TextColor,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,Parent=Fk});
            Wj.Text=(function(Ys,Em)
                local Vn=''
                for Ii=128,(#Ys-1)+128 do
                    Vn=Vn..xe(bq(an_(Ys,(Ii-128)+1),an_(Em,(Ii-128)%#Em+1)))
                end
                return Vn
            end)('\132\132','\164')..Wj.Text
            local fd=xu(1.5105971160360012*-10333)
            local function iv()
                return(function(Aq)
                    local function hl(pr)
                        return Aq[pr+-0.70532183833538598*15427]
                    end
                    for Hs,qv in ipairs(Fk.GetChildren(Fk))do
                        if qv.Name==hl(628295917/15611)then
                            qv.Destroy(qv)
                        end
                    end
                    for St,Pm in ipairs(wf)do
                        local cv=bo('TextButton',{Name='Entry',Size=UDim2 .new(1,-8,0,26),Position=UDim2 .fromOffset(4,30+(St-1)*28),BackgroundColor3=xh.LightContrast,BorderSizePixel=0,AutoButtonColor=false,Font=Enum.Font.Gotham,Text=tostring(Pm),TextColor3=xh.TextColor,TextSize=11,Parent=Fk},{ac(3)});
                        cv.MouseButton1Click.Connect(cv.MouseButton1Click,function()
                            return(function(Cl)
                                local function qb(Db)
                                    return Cl[Db-(60559+-32074)]
                                end
                                Wo=Pm;
                                Wj.Text=qb(-98711388/-32322)..tostring(Pm);
                                fd=qb(75306-14079);
                                Fk.Size=UDim2 .new(qb(45476- -6280),0,qb(33931- -8569),qb(15059-7268))
                                if not(ho)then
                                else
                                    Gr.SetConfig(Gr,ho,tostring(Pm))
                                end
                                if Kd then
                                    task.spawn(Kd,Pm)
                                end
                            end){[-449597844/21726]=19903-19873,[-181909407/-7817]=-0.00037907505686125853*-2638,[-45877- -20446]=(function(Gq,sa)
                                local qi=''
                                for Ee=187,(#Gq-1)+187 do
                                    qi=qi..xe(bq(an_(Gq,(Ee-187)+1),an_(sa,(Ee-187)%#sa+1)))
                                end
                                return qi
                            end)('\147\147','\179'),[39718+-25703]=0,[56318-23576]=false}
                        end)
                    end
                end){[-56118426/-1911]=(function(Nb,Ce)
                    local Nq=''
                    for _t=137,(#Nb-1)+137 do
                        Nq=Nq..xe(bq(an_(Nb,(_t-137)+1),an_(Ce,(_t-137)%#Ce+1)))
                    end
                    return Nq
                end)('\246\157\199\129\202','\179\243')}
            end
            iv();
            Wj.MouseButton1Click.Connect(Wj.MouseButton1Click,function()
                return(function(Bo)
                    local function Mr(zf)
                        return Bo[zf+-0.13923390949361591*23026]
                    end
                    fd=not fd;
                    Fk.Size=UDim2 .new(Mr(0.81754526804031757*-22422),0,0,fd and((12615-12581)+#wf*Mr(118392624/-23688))or Mr(-9247+-19745))
                end){[188741224/-23006]=-26996+27024,[-33496+1298]=-23040+23070,[5455-26992]=4.7653085537288542e-05*20985}
            end)
            return{Instance=Fk,Get=function()
                return Wo
            end}
        end){[54245-26193]=652800/21760,[-38918+31915]='',[-0.33008976090237507*-25178]=false}
    end;
    ak.addMarkdown=function(cn,Or)
        return(function(bg)
            local function Os(Lu)
                return bg[Lu+(-21515- -1550)]
            end
            local tn,nj,Zg=mk(cn,14517-14443),Os(224718728/5512),Os(28309+-18678)
            for gq,kn in ipairs(Tg(tostring(Or or Os(31086+-9876))))do
                local Lm=kn.Link~=Os(-6384915/-597)
                local Xf=bo(Lm and'TextButton'or'TextLabel',{Name=Lm and'MarkdownLink'or'MarkdownText',Size=UDim2 .fromOffset(math.clamp(#kn.Text*7+8,12,Ic),0),AutomaticSize=Enum.AutomaticSize.Y,Position=UDim2 .fromOffset(nj,Zg),BackgroundTransparency=1,Font=Enum.Font.Gotham,Text=kn.Text,TextColor3=Lm and Color3 .fromRGB(65,115,210)or xh.MutedText,TextSize=11,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,AutoButtonColor=false,Parent=tn})
                if Lm then
                    Xf.MouseEnter.Connect(Xf.MouseEnter,function()
                        return(function(ll)
                            local function sg(Gc)
                                return ll[Gc-(-1407+-10013)]
                            end
                            H(Xf,{TextColor3=Color3 .fromRGB(27259+-27219,sg(0.38724533603934119*25622),1508675/8155)})
                        end){[26948+-5606]=2546370/28293}
                    end);
                    Xf.MouseLeave.Connect(Xf.MouseLeave,function()
                        return(function(wr)
                            local function Cq(sc)
                                return wr[sc-2216100/-2670]
                            end
                            H(Xf,{TextColor3=Color3 .fromRGB(14746-14681,-0.19725557461406518*-583,Cq(1.6910229645093946*-2874))})
                        end){[-9301+5271]=28023-27813}
                    end);
                    Xf.MouseButton1Click.Connect(Xf.MouseButton1Click,function()
                        return(function(Dk)
                            local function xl(ln)
                                return Dk[ln+-1.2569741697416974*-13550]
                            end
                            local xt=Lb(kn.Link);
                            cn.page.library.Notify(cn.page.library,cn.page.library.T(cn.page.library,(function(nm,Oh)
                                local Lv=''
                                for cu=110,(#nm-1)+110 do
                                    Lv=Lv..xe(bq(an_(nm,(cu-110)+1),an_(Oh,(cu-110)%#Oh+1)))
                                end
                                return Lv
                            end)('[\171\195\216\246\17\200X\149\197\218\230\18\218','6\202\177\179\146~\191'),(function(Gd,Ne)
                                local pf=''
                                for sl=95,(#Gd-1)+95 do
                                    pf=pf..xe(bq(an_(Gd,(sl-95)+1),an_(Ne,(sl-95)%#Ne+1)))
                                end
                                return pf
                            end)('3\"\17\213\26,\20\208','~Cc\190')),xt and cn.page.library.T(cn.page.library,(function(Wv,Nu)
                                local Bp=''
                                for kg=34,(#Wv-1)+34 do
                                    Bp=Bp..xe(bq(an_(Wv,(kg-34)+1),an_(Nu,(kg-34)%#Nu+1)))
                                end
                                return Bp
                            end)('9op+[0\150:Qa/O6\132\48','T\14\2@?_\225'),(function(Id,mj)
                                local Ip=''
                                for vo=30,(#Id-1)+30 do
                                    Ip=Ip..xe(bq(an_(Id,(vo-30)+1),an_(mj,(vo-30)%#mj+1)))
                                end
                                return Ip
                            end)('\161\140)Y<\142\138\55[y\137','\237\229G2\28'))or tostring(kn.Link),xl(-44505+19063))
                        end){[30326460/-3606]=28472+-28470}
                    end)
                end
                nj+=math.clamp(#kn.Text*(-177002/-25286)+Os(-59581845/-19189),Os(-0.045604854827573676*27519),Os(-1.1131771924573481*-26728))
                if not(nj>0.015864957481913949*15758)then
                else
                    nj=-3057- -3067;
                    Zg+=Os(17679- -18785)
                end
            end
            return tn
        end){[-0.68405374991725687*15107]=-80500/-11500,[25326-24081]='',[-5445+-3825]=nil,[-5.445736434108527*3096]=1393-1385,[-299894532/-30639]=-3588750/-14355,[-310021208/-14902]=-0.0010301844030081385*-9707,[-23422- -2202]=-4932/-411,[11614- -4885]=-0.0047531027198310007*-3787}
    end;
    ak.addInfobox=function(_w,Ut,Ws)
        return(function(Lp)
            local function cg(ye)
                return Lp[ye+0.42127701764822528*20172]
            end
            local cj=mk(_w,cg(255548700/-12450));
            bo((function(to,if_)
                local Y=''
                for Xq=234,(#to-1)+234 do
                    Y=Y..xe(bq(an_(to,(Xq-234)+1),an_(if_,(Xq-234)%#if_+1)))
                end
                return Y
            end)('\f\49\180p\20\53\174a4','XT\204\4'),{Name=cg(28991+-25132),Size=UDim2 .new(cg(18616224/-561),-24813- -24793,0,0.00065850125115237714*30372),Position=UDim2 .fromOffset(cg(1.7677514792899409*-4056),cg(-2338+-27169)),BackgroundTransparency=cg(0.87036239463483667*16253),Font=Enum.Font.GothamSemibold,Text=Ut or _w.page.library.T(_w.page.library,cg(-29116- -17423),(function(Wn,kb)
                local Ln=''
                for Vg=23,(#Wn-1)+23 do
                    Ln=Ln..xe(bq(an_(Wn,(Vg-23)+1),an_(kb,(Vg-23)%#kb+1)))
                end
                return Ln
            end)('\212\193\251\192','\157\175')),TextColor3=xh.TextColor,TextSize=cg(446- -8465),TextXAlignment=Enum.TextXAlignment.Left,Parent=cj});
            bo(cg(29961+-26011),{Name=(function(rn,Tu)
                local f_=''
                for Pe=32,(#rn-1)+32 do
                    f_=f_..xe(bq(an_(rn,(Pe-32)+1),an_(Tu,(Pe-32)%#Tu+1)))
                end
                return f_
            end)('\254J_\156\245K]\138','\183$9\243'),Size=UDim2 .new(-18980- -18981,cg(12131+6355),cg(-32533+-6658),18731+-18759),Position=UDim2 .fromOffset(-282030/-28203,cg(-44502- -8966)),BackgroundTransparency=4.171881518564873e-05*23970,Font=Enum.Font.Gotham,Text=Ws or cg(263783157/-18843),TextColor3=xh.MutedText,TextSize=230802/20982,TextWrapped=cg(-1.0653383230504703*-9887),TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,Parent=cj})
            return cj
        end){[22552+-21224]=310230/31023,[1.1306711156557774*-18581]=0.00035536602700781805*14070,[-2551+-28142]=7.2306579898770789e-05*13830,[27756+-30951]=(function(vt,Hb)
            local pt=''
            for mv=29,(#vt-1)+29 do
                pt=pt..xe(bq(an_(vt,(mv-29)+1),an_(Hb,(mv-29)%#Hb+1)))
            end
            return pt
        end)('\204d\30%\250\237\134\55\187\208f\f\21\209\224\151=\191','\165\nxJ\165\137\227Q\218'),[-23306+-3732]=0.0011396271140082966*21937,[565810661/29731]=true,[0.77033850757434075*16041]=(function(Yk,qs)
            local Un=''
            for jm=13,(#Yk-1)+13 do
                Un=Un..xe(bq(an_(Yk,(jm-13)+1),an_(qs,(jm-13)%#qs+1)))
            end
            return Un
        end)('\136v~}\149ql~\164','\193\24\24\18'),[-413529800/-15325]=-14304- -14284,[-3108- -25752]=21254-21253,[10374+-15875]='',[27472-10063]=0.00053198563638781756*22557,[-11263- -23711]=(function(Bb,mt)
            local k=''
            for qc=254,(#Bb-1)+254 do
                k=k..xe(bq(an_(Bb,(qc-254)+1),an_(mt,(qc-254)%#mt+1)))
            end
            return k
        end)('\176\31a\224\168\27{\241\136','\228z\25\148'),[3.8362082362082361*-6435]=15826/15826,[-23945+11917]=1869052/30146}
    end
    return table.freeze(Es)
end)({[-11665500/1111]=35604/1978,[0.1940708378842253*-32045]=-0.007088278328727036*-30755,[-3309- -8367]=26053+-25869,[378943745/-21367]=(function(Bj,ej)
    local Wu=''
    for y=192,(#Bj-1)+192 do
        Wu=Wu..xe(bq(an_(Bj,(y-192)+1),an_(ej,(y-192)%#ej+1)))
    end
    return Wu
end)('P\185\189.\29\53%|q\153\189.\"\50\54l','\5\202\216\\T[U\t'),[-27570- -31528]=(function(na,og)
    local Dq=''
    for fe=109,(#na-1)+109 do
        Dq=Dq..xe(bq(an_(na,(fe-109)+1),an_(og,(fe-109)%#og+1)))
    end
    return Dq
end)('\"O\194\229\56A\223\238','o \173\139'),[-2427- -30179]=0.0030076558512577472*10972,[-23929+18337]=(function(kh,Ed)
    local ei=''
    for yt=47,(#kh-1)+47 do
        ei=ei..xe(bq(an_(kh,(yt-47)+1),an_(Ed,(yt-47)%#Ed+1)))
    end
    return ei
end)('\170h\218\131a\201\137','\250\4\187'),[41131+-13935]=-188870/-18887,[0.30682905611135275*22990]=-0.00032029723583485472*-31221,[43877-22957]=-3639056/-23032,[-44147+26768]=24806-24574,[-7290+26626]=-556339/-11837,[31517640/10612]=7751-7720,[-8.4035743973399839*-2406]=28183-28101,[211020768/18204]=(function(Oa,Tp)
    local O=''
    for Jo=154,(#Oa-1)+154 do
        O=O..xe(bq(an_(Oa,(Jo-154)+1),an_(Tp,(Jo-154)%#Tp+1)))
    end
    return O
end)("\169\255\131\51\150\200\26\29\200\'\145N\224\197S$\167\158\134{!\134\140\245\204>\173\192\r\22\156j\204q\251\134@=\154\221\155|q\134\205",'\228\144\236]\193\169hx\232J\228=\148\229!Q\201\190\233\21\1\242'),[-211829517/21773]=(function(Tl,df)
    local Fv=''
    for Ck=15,(#Tl-1)+15 do
        Fv=Fv..xe(bq(an_(Tl,(Ck-15)+1),an_(df,(Ck-15)%#df+1)))
    end
    return Fv
end)('\228\227','\150'),[3.5562130177514795*-7943]=(function(sh,md)
    local or_=''
    for E=217,(#sh-1)+217 do
        or_=or_..xe(bq(an_(sh,(E-217)+1),an_(md,(E-217)%#md+1)))
    end
    return or_
end)('.\171\27\189\210\56\193\204s\219+\6\216\48\"\241\b\170\142Q\166\164y\213j!\142\54#','F\223o\205\161\2\238\227\23\178Xe\183B'),[585254147/19183]=-6878376/-27624,[-5326750/715]=-74520/-7452,[11583-241]=-414936/-5763,[-8580- -30315]=0,[-6551330/24910]=(function(gl,Rb)
    local km=''
    for Hp=57,(#gl-1)+57 do
        km=km..xe(bq(an_(gl,(Hp-57)+1),an_(Rb,(Hp-57)%#Rb+1)))
    end
    return km
end)('\141\138','\255'),[-451353232/-17908]=-28093+28094,[4863-4222]=-453530/-14630,[0.00053914168643519518*-27822]=-606- -826,[-24022+24567]=(function(Up,bb)
    local ps=''
    for Lj=248,(#Up-1)+248 do
        ps=ps..xe(bq(an_(Up,(Lj-248)+1),an_(bb,(Lj-248)%#bb+1)))
    end
    return ps
end)('\135\135\205\191\157\137\208\180','\202\232\162\209')},...)
