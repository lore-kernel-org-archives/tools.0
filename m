Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4843208;
	Fri, 21 Oct 2022 15:44:55 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id u21so7384012edi.9;
        Fri, 21 Oct 2022 08:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zdIWRzA7x65+un/5AKjqVnVu15A+QtuG2iRGGT7JD7A=;
        b=TRYNjpRzG0OK/G9uGQ1h1ADA5UDvV7PwHDmy8R02LbrzmV0UFWlcV69ToemOXIw2pi
         XDsoWMSLz3/86yLMuLeZ3ZF3hRtnJtUFbBqPFLRQWBQfKKZyTjJ+EHb4cE0aafuyeumT
         RobnBKNvoFQI9Q3P1jXYBRj78CJlFkEk/9TtHkSzRY/Mya3oa5oUSugjaAKRHTdX3ND/
         LavR4+QL4p2rhSj1q/FccuzNWWtI+2ULS3qdHj7y8dmtC6b1KUDF6vVmB7HdbHaCK37S
         dXQLDg+Cb/NPfeDfjydjV+hHkUB3adiQ0W7J3EOYb6YvT0Yvyqdgv595+QiU2QGa+TLA
         ZKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdIWRzA7x65+un/5AKjqVnVu15A+QtuG2iRGGT7JD7A=;
        b=GZA64KSFi48BDU18GyDXgX3y2zhghV/c1x2SHD6CnTXS5B2vobuDZ6PgEbsLbu7kmo
         OawigxkWLz+oZFNyxYZsqkuscTbN9rnKJCjNmFK2GFvzZQWw07DdcFE7xA5y/aMtsH4z
         owYGsluMruN/tIlV1Uo4GeKpoc+YxVdrK2gBSigJiUc3vbeOsbTlrKCxFK45L3smaT+5
         acSlZsSf3kfkxT4l8G6IKohv2gUvsQv1camw1ZKF7kVOr/G80S5evTAUsWiMfGUmsqNc
         gV7ZZXclmHXJbkyCid6MImkdqn6icrCShq3p1MhK95+PnVpKR9SI+bZJ0IGXoVkWy33m
         8C9A==
X-Gm-Message-State: ACrzQf2y03PiROZyhwDyKJoy0ls/1RSZszbk/LO9fKjmY5s8se9CEoef
	Kt81HUxGxhUBsulDFyfe7yI=
X-Google-Smtp-Source: AMsMyM6eAZb5Znd9UY54s2/K8ydgLnq5V9GtuJawlI54nKAgZDAckJdmFvS5phynkmJ22gUzGhdNPQ==
X-Received: by 2002:a05:6402:5ca:b0:445:c80a:3c2 with SMTP id n10-20020a05640205ca00b00445c80a03c2mr17946650edx.247.1666367093696;
        Fri, 21 Oct 2022 08:44:53 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id v25-20020aa7dbd9000000b00456c6b4b777sm13431863edt.69.2022.10.21.08.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 08:44:52 -0700 (PDT)
Date: Fri, 21 Oct 2022 17:44:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4 shazam --continue
Message-ID: <Y1K+czGJHoCd/4z6@orome>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ag/ZcsF8xfkfuc9a"
Content-Disposition: inline
User-Agent: Mutt/2.2.7 (2022-08-07)


--Ag/ZcsF8xfkfuc9a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

when I apply a patch or series and midway some error occurs (could be
checkpatch or conflict, for example) shazam will interrupt the operation
and drop me to a shell. I can then resolve whatever errors those are and
resume using git am --continue, but that has the side-effect of loosing
track of the patch/series. Things like added Link: tags still work, but
thankyous are no longer tracked.

I've gone through the documentation and various b4 threads on this list
but haven't found any solution to this. Is there a way to have shazam
pick up where it left off? Or would it be possible to add such a
mechanism?

Thanks,
Thierry

--Ag/ZcsF8xfkfuc9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNSvnAACgkQ3SOs138+
s6HVOg/8D+9s3R8dlg5+8S9D3UtLC7JYhZ/x5yPULoFlt5uXFcAO7BnCAV873reI
TBssOWVM6+FzSuvJ2Pl0DjmOqHd5eLFykeVO8pof+h4jetZHqXSzDHPigJWh+EYX
WsAzEtjEyyuY3a5b0gz19ze7V4hybACNOVRa2NrpziKncfMbLOQ/nwHVc98g2TNG
VohkOHQYp6vrrS5cSy2SSNwmDloqKw+r2cjH5YtY8pJJbCCUcscJ0chUH2f2cdkN
Jgs6aXvosMSi/J481hXmxUVUijFeGPXWnL7zIcuClL5TK1bp4CpeupnX7Y+5KTiF
IJnqxUFUM9/1gZipmSYRPIWeApoPTTq1CoRxiJwKKmzvn/jpBwGx1PgsJ7cXjRac
ePplK1ddRZCTjGOHa51i5Xaue3qFYLUzKW84MJdVhJV07ibKUsZG6yud8FN2NSYf
nkpgbo5c0zNVDCxuq5Fd0zmiEuAdy1oAayNwQRLtcihikWkR1MvrxRezmYkIrryl
CaegO/oht/u8qcEAm2BSLi+jvseU6oL21LjxKTz573LuwuTngH1YTJC4PJmqLofp
Bylwf3WrAa7cErx5X2q0Dj+D2WxyvTqGaxWy9bI035ONWbFqq0NrmpXcURH+/Hoe
BeLeOjKMaay3SAyT8P5tHoadMlo/YVl03Shmn2amAn/YUem8BUA=
=MO7e
-----END PGP SIGNATURE-----

--Ag/ZcsF8xfkfuc9a--
