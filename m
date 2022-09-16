Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B466712
	for <tools@linux.kernel.org>; Fri, 16 Sep 2022 18:13:22 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h21so16550384qta.3
        for <tools@linux.kernel.org>; Fri, 16 Sep 2022 11:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date;
        bh=xEDmDBFCQhTcB37xYoXTFElzIFJbtvRe2PY7Qg8gN5I=;
        b=Tio5fmOHgaRyhkesBuFazPwxuE16HpwH3DhBn10RmdeMC6kyR41vYIrVGXzJXp9RJq
         iea1bXjucwD7+mSw3ZNejnHOgfO8g78e4ZyBlvTXF6zNKSY4Og6sB18ZrhbQH4AYor66
         8w7rN3WUJvHGMgZOkkkIZ3U37r/wwYJrZWsa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xEDmDBFCQhTcB37xYoXTFElzIFJbtvRe2PY7Qg8gN5I=;
        b=OFZOg2G9DuS1WOLA+8CnxDKE7JgUmlWWmDo2uoOar2/xPU7jlG2wbeC5zR2khpC+2c
         jW99u3EqXVAW9ecLJLBPbyskAheWrki1jqGpFLVsoGa6pYH/X//zcHT37Og3cnpsyD/d
         +oqIw+2Wr9g7VM8xzkCtjFOu7bk+FBiY3fd8heT2h6OSJ4+84HT3f7hVpYKdg5mcAW3L
         rMK5cNbtLXbtTEYxLhZx0gg1XQk4jhIh1JgIp+natJ1uBM6adi+SBK/khw1TYs3XmyEC
         Fl/psjoVTC92bb9utFu18X2vdbiZYgiyrJVbcWEI/z7MXkEiC2XJtrkFi8C3gNhz8BAg
         eHFw==
X-Gm-Message-State: ACrzQf1vImXmViqEoOUdg1UPhTIAq+4u9/XLE9vt0nPy1xriCe0xC3x0
	EJevzt4gGV9yhane8MOgqj5cBUrX3ahb8A==
X-Google-Smtp-Source: AMsMyM61q4kqIZfkHDoHy5JMpuvV7LRnBO1UljglED4vikQXioJM7l/uvBQT9S5RQdJ6u8VmHJPdJw==
X-Received: by 2002:a05:622a:1b8c:b0:35c:c455:9150 with SMTP id bp12-20020a05622a1b8c00b0035cc4559150mr5599242qtb.166.1663352000950;
        Fri, 16 Sep 2022 11:13:20 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id y30-20020a37f61e000000b006a6ebde4799sm6348665qkj.90.2022.09.16.11.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 11:13:20 -0700 (PDT)
Date: Fri, 16 Sep 2022 14:13:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 v0.10.0 is available
Message-ID: <20220916181319.okfskienqh6kfeor@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzikt4exeit7cppb"
Content-Disposition: inline


--lzikt4exeit7cppb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, everyone:

After a long period of churn, version 0.10.0 of b4 is available. The major new
feature in this release is a set of contributor-oriented features aimed at
making it easier for developers to prepare, submit, and refine patch series.

This new set of features is documented at the new documentation site:
https://b4.docs.kernel.org/en/stable-0.10.y/#for-developers

EXPERIMENTAL warning: please note, that developer-oriented features (prep,
send, trailers) are brand new and undoubtedly contain bugs. Please report them
to the Tools mailing list at tools@linux.kernel.org.

New in this release
-------------------
* Developer-oriented features (prep, send, trailers commands)

* Patchwork integration, which allows setting patchwork state on the patches
  retrieved and accepted via b4 commands. See documentation at:
  https://b4.docs.kernel.org/en/stable-0.10.y/config.html#patchwork-integration-settings

* The "trailer-order" setting now only reorders the trailers in your own
  custody section of the commit message. See documentation for what that
  means.

* Web submission endpoint support for "b4 send" -- it is now possible to
  submit patches without having access to an SMTP server. See documentation
  for details:
  https://b4.docs.kernel.org/en/stable-0.10.y/contributor/send.html

* Adds a "trailers-ignore-from" configuration option that allows ignoring
  followup-trailers from specific email addresses (like lkp@intel.com).

* Bugfixes and improved tests.

Upgrading
---------
If you've installed from pip, you can upgrade from pip as well:

    pip install --upgrade b4

For all other installation options, see docs:
https://b4.docs.kernel.org/en/stable-0.10.y/installing.html

Special thanks
--------------
Huge thanks to everyone who was patient enough to test out the new contributor
features despite many initial bugs. Overall, the following people have
contributed to this release (in reverse git log order):

* Mattijs Korpershoek <mkorpershoek@baylibre.com>
* Sudeep Holla <sudeep.holla@arm.com>
* Mark Brown <broonie@kernel.org>
* Maxime Ripard <maxime@cerno.tech>
* Conor Dooley <conor.dooley@microchip.com>
* Philippe Blain <levraiphilippeblain@gmail.com>
* Rob Herring <robh@kernel.org>
* Vishal Verma <vishal@kernel.org>
* Dmitry Torokhov <dmitry.torokhov@gmail.com>
* Lucas De Marchi <lucas.demarchi@intel.com>

Best regards,
Konstantin Ryabitsev

--lzikt4exeit7cppb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYyS8vwAKCRC2xBzjVmSZ
bIKyAP0UQbwtcarBm5DIb2CeBWe7SHRP/wOa+v/WcEgXGeD7YwEA+C6s1NiascZK
gYc/Vi/x542nclfP/VFZHy54W5PJ1wg=
=dMk3
-----END PGP SIGNATURE-----

--lzikt4exeit7cppb--
