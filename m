Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9B44C61
	for <tools@linux.kernel.org>; Wed, 31 Aug 2022 19:23:19 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id j1so11839715qvv.8
        for <tools@linux.kernel.org>; Wed, 31 Aug 2022 12:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=T+NuJCiTS+BrMoIflTVhnxUfmq9o7D+fv0J719UWkjo=;
        b=WUVyvXf5SO3AXb/vGzwZ3kdvzH17Ghp1Mm8axoQLmTjVyfjxftLheuLS66OP46qR0V
         BGdwX7+X+T8nRgFTmQE6bxTJvEgJ71ErJhKIptdnChSURqhOrnSnD/TH0AOvRECD9Dkm
         HpP7z3QmpJpyhwms+7L39zPOKNuxxmUN3NQes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=T+NuJCiTS+BrMoIflTVhnxUfmq9o7D+fv0J719UWkjo=;
        b=wvPgOoxTp9TWZ5VC2oddmZf9R8Z7yf1IrOMuOeLBV7MYGahbKr2jhyEDfIv6fSDBPP
         LZQMNhlq/aFZxIIwgdl41wWF6VEJUnriQ/fs/fDZK3GmkOGMUq9xsbPRwcschfwEvne6
         6A1tr1//Y6cyjq/mMrBEH2aNewUhS9BSBKE5xytO+M6xFPMj85GVbnjzrYjOFIJx2PRH
         xuZJEXBPwIsZ2id/6uk9W0E096yLpC+gZnB3nvLQFOkn8BFyCRVncBjBW4oMPZ20lvp8
         XWQ0wxufOni9xtb2CRvsDIC79Oio2PLkjh0Q1y+z6Fq/wLBlS16w137bqMFgOHn/kgwk
         FDZQ==
X-Gm-Message-State: ACgBeo3XH3Pa2pTvBlzpzyupAk3WTNJ/bzB4TiVDBUTxqYkUiIJAcoFp
	7mVbEeGyeQEM8aYBfkGOb/H7J6xV1ouLPQ==
X-Google-Smtp-Source: AA6agR6tvJdpFgQ8fx2fexDnCUOSbrG98jvK5wRGcA0ZQQXahZHRYEbW4+dSdDpbI952E/aya4P1Yw==
X-Received: by 2002:a05:6214:ccf:b0:499:6da:1dbb with SMTP id 15-20020a0562140ccf00b0049906da1dbbmr12218082qvx.53.1661973798108;
        Wed, 31 Aug 2022 12:23:18 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a15-20020aed278f000000b0031ef69c9024sm8645608qtd.91.2022.08.31.12.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 12:23:17 -0700 (PDT)
Date: Wed, 31 Aug 2022 15:23:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vishal Verma <vishal@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: Couple of b4 trailers issues
Message-ID: <20220831192316.4aqimdck23j46aqt@meerkat.local>
References: <2517d5cdff57048a13e85b9604957b73b69724c3.camel@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jagahov7np5cilmh"
Content-Disposition: inline
In-Reply-To: <2517d5cdff57048a13e85b9604957b73b69724c3.camel@kernel.org>


--jagahov7np5cilmh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 31, 2022 at 11:19:12AM -0600, Vishal Verma wrote:
> 1. I get a traceback (attached at the end) if the tree contains
> (recent?) merge commits. This patch fixes the splat, but I'm not sure
> is the right solution - I didn't spend too much time on understanding
> what the parent/commit/end checks were trying to do.

Thank you for testing it out. I'll apply a fix shortly.

> 2. b4 trailers doesn't seem to respect the ordering from git config
> b4.trailer-order

That feature was gone for a while, but is now back in a new, chain-of-custody
respecting version. It should be in the latest master.

-K

--jagahov7np5cilmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYw+1JAAKCRC2xBzjVmSZ
bAkGAPoD9h4aWifUmAltWZIorXHFsKhwQalqo9JDJ2XZdn0h6gD9GUIyQ8WRQ9eP
qpSBSwAB1eTDkTxs2AIqWUHsU3p8sQw=
=TI69
-----END PGP SIGNATURE-----

--jagahov7np5cilmh--
