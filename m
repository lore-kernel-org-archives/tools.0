Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5194C7F
	for <tools@linux.kernel.org>; Thu, 15 Sep 2022 19:59:42 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id s18so11496432qtx.6
        for <tools@linux.kernel.org>; Thu, 15 Sep 2022 12:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=3Bu/rUKyjLpGU5x12Q4LEQFBULtpXMnJsPeWzayNTO4=;
        b=PQkaAh2WlVhJHnUGxkOFmZz6/NgcpfuIDgSdkPrVEWptlo5hk+GEdn5/RlPb0hmErV
         prufY24wc7M9/tSReKvXlyLsYhH8ot/jYVtljSo8zGZGw0Bs+22TxqI0ssrOBmeXszrF
         EFbXrjlXrT5Gh+XvCSBzOfwMvVJSHLJPt2yEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3Bu/rUKyjLpGU5x12Q4LEQFBULtpXMnJsPeWzayNTO4=;
        b=1qXhj8KMfi+Nu6agEjkWAygMmIfcIgTOUxgvHHfCvRLsHMVFLpfzl9+KdDUlccALYA
         6azB9lduXiJS3jtN5GpDCbXOfhcMakMf5mmSAybc6+Sokfc8eju2I1DyfxkmmDQ9loeR
         x8OVrcE/h31Gx22nJeR5NX65Qq5zk4/DV3ix2XOrHwD/lE5Zij6SaHhO5UlNWTNCXObT
         nFcmDcFlx+Q+Y81VkgrHwjuLt+iyVmjUH5KPyKNV+AabfbM9Av+2MZDfjHJjGSeiVmR3
         gDfQIlDC9M7138MVnquSPXAg7AVgbXyNbXbdDf+DkO6s47xd8cFGvF6cK2bBPgDlxzhV
         sQWw==
X-Gm-Message-State: ACrzQf2pufcfPLwfuDPkGeX4qDxCunLWul+vjrnBx115pu5HF2WrMdai
	BO09++/3baM1VqulbGGmX8nyGu/vZq5tcQ==
X-Google-Smtp-Source: AMsMyM4TqxLmbBopV1O4qjqlvFbthujz2ZZVeSYP8dG5jSNk84p3/YqODQzP54CstNDbNXUumoVl7A==
X-Received: by 2002:ac8:5c4f:0:b0:35c:18b8:5427 with SMTP id j15-20020ac85c4f000000b0035c18b85427mr1453565qtj.648.1663271981573;
        Thu, 15 Sep 2022 12:59:41 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id s14-20020ac8528e000000b00342f05defd1sm3876566qtn.66.2022.09.15.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 12:59:41 -0700 (PDT)
Date: Thu, 15 Sep 2022 15:59:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, users@linux.kernel.org
Subject: b4.docs.kernel.org available
Message-ID: <20220915195939.6mcd2u2b5z5q56u7@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vnsgin3j4pn7hfin"
Content-Disposition: inline


--vnsgin3j4pn7hfin
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

I was trying to complete this before the Plumbers, but better late than never.
There is now online documentation for b4 available at:

    https://b4.docs.kernel.org/

It includes the "contributor" section for features that are coming up in
v0.10.

If all goes well, I plan to release v0.10.0 tomorrow.


-K

--vnsgin3j4pn7hfin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYyOEKwAKCRC2xBzjVmSZ
bI/7AP9HIVNXUoTaevUpOUCcLwS2J3Hx7vQdY3fuIiaJKhDS5gD8DJNX4cvPVoOP
pV0Cfze4Ih0GuQKJxh8UXpEkWVWKxgg=
=3zal
-----END PGP SIGNATURE-----

--vnsgin3j4pn7hfin--
