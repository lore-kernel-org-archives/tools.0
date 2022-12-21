Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9B31C13
	for <tools@linux.kernel.org>; Wed, 21 Dec 2022 14:45:04 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id mn15so10424012qvb.13
        for <tools@linux.kernel.org>; Wed, 21 Dec 2022 06:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXqgYXQDNYEy9Xt/FUhm0JCmslWpWRGYL63ZAL3U0JA=;
        b=CtLm4eBYPFq8VZgbrChR2RA/jY8sqFC1Yjv5ZNG/QrUoNJgSZl7Fd6H3adKT6klO6D
         6eG7HOjhrhRtqWSCARb/VyIr6imi6BGbLxk56KX0XyP2KNbKjmSv9qRN+Tor5FFHNpRd
         HTMUkio84rDytPtWmsFWSRDHOF/MMHSibwR78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXqgYXQDNYEy9Xt/FUhm0JCmslWpWRGYL63ZAL3U0JA=;
        b=OsVB31/RIdZJplGE2iFm+F1C3wbIFAsRSmuwD/CZx7D483KWvnC1preyY120My6uk2
         ttCMldj5hmVGiLBeC6wHYpG7v2mZPhyYNDh81yaLJCaHqjob7P41Z76++g0gF8kJoxaO
         VVVVvHekUtUwhdeyTHpL/G6QbgDdlC5MV+tFxAq4+Ayg9Tv4i55HTTyxGFO6H8eS0/4q
         ZNKtIsoQmycp3XeLb8JPZEfIqN+BIjOyS1tAqXwR2up3WU29tfQw6IYi9MQq7CYq2JTY
         phdNUMwR7JMNmWPGTu4uUA9zurMcnUtNG2tXHkBVpyNyE+jV20q/MUCpG90jF4MDY7pS
         34fA==
X-Gm-Message-State: AFqh2koaXGo8KbM1CacOzvZWa7D3RUHx/rnQijKtHFcpYEgMOAhFAYw3
	uaifssx8LeCbDqJZNVi4RfE6NdT9BUSJ8boA
X-Google-Smtp-Source: AMrXdXu/LYz933kmxWXTJ/NKiHZajMDMF4BcVKMQ262iaJPEizO3gRBXlDYrvQbSLiSZMvBxWL5GPA==
X-Received: by 2002:a05:6214:5b07:b0:4c7:5e1:1466 with SMTP id ma7-20020a0562145b0700b004c705e11466mr2354600qvb.26.1671633903469;
        Wed, 21 Dec 2022 06:45:03 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006b5cc25535fsm7141833qkp.99.2022.12.21.06.45.02
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 06:45:02 -0800 (PST)
Date: Wed, 21 Dec 2022 09:45:01 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 v0.11.1 released
Message-ID: <20221221144501.7cnvrlkdgfmuw73q@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jdgsblucmzcq3dbk"
Content-Disposition: inline


--jdgsblucmzcq3dbk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello:

This is a small bump release with mostly cosmetic changes aimed at improving
the user experience for someone submitting their first kernel patch with a
minimal git configuration.

Konstantin Ryabitsev (5):
      Increment version to 0.11.1-dev
      ez: don't crash when there's no [sendemail] section
      ez: give better error message when patatt signing fails
      ez: use default web endpoint when in the kernel repo
      Prepare for 0.11.1

-K

--jdgsblucmzcq3dbk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCY6Mb7QAKCRC2xBzjVmSZ
bNR6AQCQcl03lJuaCOyPOr0pNDpjotCZ9jiTk0s76sHbtgpcuQD+Iqz97h1042lv
GxjA+lfXpUPhnAk1dUVfytwFn+GNhwA=
=qon/
-----END PGP SIGNATURE-----

--jdgsblucmzcq3dbk--
