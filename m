Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5E812
	for <tools@linux.kernel.org>; Tue,  4 Apr 2023 08:16:10 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id s19so19144094pgi.0
        for <tools@linux.kernel.org>; Tue, 04 Apr 2023 01:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680596170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JS2FebHY5XwGhoN8TK3eRaOmFfR0S3vZkA1YVoRMUIs=;
        b=lmQlXPLcQk6v+53GmQWwPGiWFGaxgNywsTVDf6emWF3qMsGLzWEkolbpW9Wab/+Hng
         ccDnoRU2CF0+FUZYKm83Zx2yEpqaXvwbZ4Clbna+TkGtx+HYHVRSW9VgVbpUJ44Il3pC
         XPzn2hwAk18MrT79n+0FBTOUaMqTqgTqq7Je4wE8/GIw2zsSkEirfbcZzI4jyiVhFt9W
         40B7+jPgS34L2Yo6zaLeLBP9f918xVTSNj8JJt9udTXHGg6HovC3fdUrEEJ7UAsbnI13
         FN/nUeN8Cm/35c6RXqjpY3DJ6aw+osJNV6HpSvvcsrhPc0w3oGEhApmgaCMfQlQsG1lk
         NyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680596170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JS2FebHY5XwGhoN8TK3eRaOmFfR0S3vZkA1YVoRMUIs=;
        b=CMwVuIUkeVW+kwFaaUusPcaXQ9r+2xl9RrNcijjYElN5iN9YvDHU6WM6XQ7SsoOUD5
         AfhaI5vXdjih3J9R+fNcE2ucwty2iblK9757BkV1S5MQrbTUW9Gyunt3DuIK5HU7q3uA
         s4P0aI09l5bJxMO/dY7elHeTGAn1MnKbj627OF53ScA37V8JT/YnlB/YtKrxIurN6IBr
         41p73HySVQn9ULafxn9bBriZVx1hUi0sNI1cO2dbP6exsSRzh6tfSkS2xVKMxTlZTuzR
         VF1gqZgDkKzWO4FQNwF+pzkBvPKypXdUmCIlC/w9/LdjLeEZTWIKKsS5TrvsW6kjkSkQ
         e94Q==
X-Gm-Message-State: AAQBX9eBfT+8H03f7FJzHDkSLPnEQY/XlBW2QDFTUQBsPOraCEHrcTcN
	T1yCbWDWgRagkq/eLsb7l10=
X-Google-Smtp-Source: AKy350Z4lly1T9IcXIhHUYSMRnTU3AptmLhEk+dLJn8of07Eqd+zRBjpehfcp30hgdrCUe2+X/xYCA==
X-Received: by 2002:a62:6203:0:b0:62a:9d6f:98dc with SMTP id w3-20020a626203000000b0062a9d6f98dcmr1296816pfb.11.1680596169931;
        Tue, 04 Apr 2023 01:16:09 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-10.three.co.id. [180.214.232.10])
        by smtp.gmail.com with ESMTPSA id e14-20020a62aa0e000000b00622e01989cbsm1028070pff.176.2023.04.04.01.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 01:16:09 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 181A41067AD; Tue,  4 Apr 2023 15:16:05 +0700 (WIB)
Date: Tue, 4 Apr 2023 15:16:05 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, aros@gmx.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <ZCvcxVJBl/6pRMAw@debian.me>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XVlanjBueVby0D6k"
Content-Disposition: inline
In-Reply-To: <b38de7ff-3de1-cd4a-a532-66642aea587c@leemhuis.info>


--XVlanjBueVby0D6k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 07:58:40AM +0200, Thorsten Leemhuis wrote:
> How does one make bugbot forward a bug to everyone in the signed-off-by
> chain of a commit that caused a regression, which might or might not
> have a bugzilla account?  When the reporter performed a bisection these
> are the primary contacts that need to be reached out to, but the
> maintainers and lists for the subsystem obviously should be CCed.

The logic should be similar as on finding commit signers in
get_maintainer.pl.

--=20
An old man doll... just what I always wanted! - Clara

--XVlanjBueVby0D6k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZCvcwAAKCRD2uYlJVVFO
o2uhAQCMyE+Ey5rq+16PrdKhShHXPwd8HI5Q80T81YsEud+RHgEAtU2tL23X0loi
hZWkyQ2/YpWj5RbjIBL9u5mAgL1EkAs=
=kk/f
-----END PGP SIGNATURE-----

--XVlanjBueVby0D6k--
