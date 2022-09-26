Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E14422
	for <tools@linux.kernel.org>; Mon, 26 Sep 2022 17:29:06 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id j8so4696790qvt.13
        for <tools@linux.kernel.org>; Mon, 26 Sep 2022 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=2080zhmrdabzahWiCHdFe/XbzjO8Mvc1FBCGQMODTuE=;
        b=ZDfDgzgOYN9gLWbE5ZCj5TQnBAP8LBjrSQjGKc5IOVnDSvWBEyLUhXZQIpu0whocR4
         QeOzOC2+gBY8Vj4rZWPu3jgE+/QYKtw98L3bZdwZw2PiBA96OyZ3cLdjgTF2oNegyr58
         jRfFQYsxhzUp6/EoL6w/GrQowIcZstI8MhhiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=2080zhmrdabzahWiCHdFe/XbzjO8Mvc1FBCGQMODTuE=;
        b=rhwp+o9k1hZqvQiLuSoby5TT9BeNI2L7LxWq7YozKcLeZIkUWrQZ/SahugQHSBdNz/
         /T9RgnET5mV+K+Hz46E2DCeXXAj/VuGle18EMVVHBktXqDsFzoxeXkzR871fYByv4JDT
         ZEJXvyv+OsNyGJXkLGg4L1/7teRPNgza2VJ049G7HK3vrzIF8t524ddpFrpbhai+UEe+
         8P8RafAnTz/tcNNrByxL4xlCTxzbkYbDWSd2yimwrgKJ62XC2qop6Y16WjpEDQ11Q9u+
         2gvWbWi9kkyiiEZ31mb+fkGSMPuRke8lUM5by6VCHen6fFKjk5fKb9KFgSxzd3si5UxA
         4QbQ==
X-Gm-Message-State: ACrzQf34w6zoAlv2/p+MOReAMAmusMq6jMaRhfsH+QQE9OzFr/RglTJg
	fZ7EJZxSEBnmZGpAMk4czMh88ovfnujqug==
X-Google-Smtp-Source: AMsMyM7bTk/JjcJbdFcEFCDR5OPLqs+rTF45otniO/J2febUgFUAlXL7JPC+kxTW77u3UUn/xYfK9w==
X-Received: by 2002:a05:6214:27ca:b0:4a9:d3f8:9cfb with SMTP id ge10-20020a05621427ca00b004a9d3f89cfbmr18058553qvb.56.1664213345698;
        Mon, 26 Sep 2022 10:29:05 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id x1-20020a05620a14a100b006ced196a73fsm11956607qkj.135.2022.09.26.10.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:29:05 -0700 (PDT)
Date: Mon, 26 Sep 2022 13:29:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Cc: users@linux.kernel.org
Subject: b4 v0.10.1 is available
Message-ID: <20220926172903.f3mudqmts5woudll@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2u6avzzkctpjngo2"
Content-Disposition: inline


--2u6avzzkctpjngo2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

B4 version 0.10.1 is now available. This release contains the following
changes compared to 0.10.0 (among other minor improvements):

- Fixes the crash with "b4 ty" when using a local binary to send mail, and
  generally improves the [sendemail] configuration section compatibility
- The "send" and "prep" commands now properly include diffstats into generated
  patches
- Does not force single-patch series to have a cover letter. The contents of
  the cover letter are now appended to the basement section of the patch.
- Does not force "v1" to be added to the prefixes

For upgrading instructions, please see docs:
https://b4.docs.kernel.org/en/stable-0.10.y/installing.html

Special thanks to the following people for the testing and bugreports:

- Leon Romanovsky <leon@kernel.org>
- Guillaume Ranquet <granquet@baylibre.com>
- Amjad Ouled-Ameur <aouledameur@baylibre.com>
- Dmitry Torokhov <dmitry.torokhov@gmail.com>

Best regards,
Konstantin

--2u6avzzkctpjngo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYzHhXwAKCRC2xBzjVmSZ
bCuPAP999XW0ZWWJATwfPtHxDbxq5/4ujJVHO5oquJzLCI7yhgEAv15gXTsgUkkQ
kdXU+w5UJ8Qf2PMO3Ij/N5u004muTQ4=
=8tjl
-----END PGP SIGNATURE-----

--2u6avzzkctpjngo2--
