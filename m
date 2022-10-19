Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E1E53A3
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 19:21:28 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id z30so11378178qkz.13
        for <tools@linux.kernel.org>; Wed, 19 Oct 2022 12:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vg1hxaLMIkXnxou84VWTSh5UkgItEQCmO+g4vuPuMvQ=;
        b=T0U7jUL6BjJX0qzDnhIu7+LS2VjbCICbmPhemfJV8HYtv2/vq2ihBYBlWHh7eze0P1
         Y1PPGy3Iz2krBBlfo2EGRXrS6O4+UPU/vy2ibdLC7AXH+PGWDrPuOuZSMxv1+4Bgnaap
         UNCqxC3qJ+oTZqHaqetUIS7TR3BqrztqO1Mmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vg1hxaLMIkXnxou84VWTSh5UkgItEQCmO+g4vuPuMvQ=;
        b=QOVpkAUabWURSJJQFaUB84y+dMPsbLYKqJwc0S2JuBcvqW2PU6sS5BE8dvFcBztfZN
         NdEO8lWYGmHKHW37Z28Q14oKs6QcLxnmalz+FeZxibojJwprQFr0EXMULyGZJ/X3FJfC
         Cv1OGpPtimS0G9lQkC1pAT4PLec3G+HPXClP9mAiSn5yUGImb5+eqIeRXZgLwYJ4gWn+
         SxxHwf1hzl4z8T501l8By8rHIp2Uq5QXr4TosAmqYYGw/Se2J/zIFc28bMC1xDdKfB0N
         z0jwXyPpbNOc1aUD8QbJD9JLwLMiSePIOstTZbsQ5RL2wgCKw4DajUJKHeEQjvDPWCQi
         yFOA==
X-Gm-Message-State: ACrzQf37dTRkBGhAoXHXAMt8wv0o9LQ4AJLoGehm+THfB4PkVRQPXhTw
	jjpfuz5Ly1F4LqhdeTlJzzBmGw==
X-Google-Smtp-Source: AMsMyM4Z72L/0HTlVnYi0r1jo3lHkXWEovhBUAx2T9zgNvUQuG40c4ejFKA9fx4Q8QeHY62JMLr4dA==
X-Received: by 2002:a05:620a:4250:b0:6cf:a822:7c7e with SMTP id w16-20020a05620a425000b006cfa8227c7emr6973627qko.503.1666207287519;
        Wed, 19 Oct 2022 12:21:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bn4-20020a05622a1dc400b0039ccbf75f92sm4504202qtb.11.2022.10.19.12.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 12:21:27 -0700 (PDT)
Date: Wed, 19 Oct 2022 15:21:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221019192125.oujf476b7niajhd4@meerkat.local>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <20221019080140.zc42aqi7gwjpvczs@houat>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntkwtk4ifttk4geq"
Content-Disposition: inline
In-Reply-To: <20221019080140.zc42aqi7gwjpvczs@houat>


--ntkwtk4ifttk4geq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 10:01:40AM +0200, Maxime Ripard wrote:
> > Is there a reason why you have to manually edit the cover letter after a
> > rebase?
>=20
> I was under the impression that we needed to update the base-branch
> field? b4 prep -e sets it, so I was assuming it was important, but I
> might just be wrong and it's not needed.

Right, we set it initially for all cover letter strategies, but if you're
using the default "commit" strategy (keeping the cover letter in an empty
commit at the start of the series), then it's purely informational and we
don't use it for anything.

> However, if there's a conflict (which is still fairly common when one
> rebases) and we do a merge conflict resolution it's not able to anymore.
> Rob's hint in his mail that there's a patch hash to retrieve the trailer
> would explain it, the patch content (and context) has potentially
> changed after a rebase.

I'll work on fixing that -- I just need to do some yak shaving in pytest
so I can write some tests around it first.

-K

--ntkwtk4ifttk4geq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY1BOMgAKCRC2xBzjVmSZ
bPk4AP9VegdIpXi/tID++KB8Fh+2PusvC4360PyZe+C8uDj10gEAniaaAZJKhNeJ
JbbfmiqX2GsUiWkIhsyJvNnz2tlD2AM=
=tNLT
-----END PGP SIGNATURE-----

--ntkwtk4ifttk4geq--
