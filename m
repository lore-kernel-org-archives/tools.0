Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B9317BA7
	for <tools@linux.kernel.org>; Wed, 31 Jul 2024 15:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722439852; cv=none; b=ra2dVmJJ1diIHCMws3qnfRPlNJWiAgqgSL33DKrov5D1kG5M8ltQ0v6fizMqUFRGS7UYkEW2+S0iGf0iSpCgC7tPRMBFN97pzN9qoIMQXcDiLVbo7JJlUjeW3l5AP8EPfwkU4qhMDXIzgoKGd9Ef6NZDNbkRhV/UchvXNkLx2F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722439852; c=relaxed/simple;
	bh=aTdXtyN7HcJxh2kmqfLO5z+nClq3joJ73XJwPkgCypo=;
	h=Message-ID:From:Date:Subject:To:Cc; b=FfMaBZYTcJOhtm7Gc2F4rML6WojKulPfXH38zb/7ADDSPY6ItLHudHQt9/momXVbwuSbMg6QlD08sFM1DralXAa2k8cVFbS2C2cyeZdVR0/vXuMz3pnY/HHcdVl717zElhGLey6TI2BgHITUkI4lbFzG9gXZSkDA21TtzShk8Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id E8A6310192656;
	Wed, 31 Jul 2024 17:30:38 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id B50CA60923D5;
	Wed, 31 Jul 2024 17:30:38 +0200 (CEST)
X-Mailbox-Line: From a8a3945653d2867c4024656a6fe5a9c20b7976f4 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1722439238.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 31 Jul 2024 17:30:38 +0200
Subject: [PATCH ksmap 0/2] Keysigning map cleanups & graph links
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Ben Widawsky <bwidawsk@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linus.walleij@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>

The key ids on the kernel keysigning map link to pgp.cs.uu.nl,
which has been defunct for a while:

https://www.kernel.org/doc/ksmap/

I propose linking to the graphs in the pgpkeys repo instead (patch [2/2]).
As a byproduct, I'm cleaning up some stale or incorrect data (patch [1/2]).

I think I would technically be allowed to push directly to the ksmap repo,
but naturally I want everyone (and Konstantin in particular) to review
the changes beforehand and provide acks or raise objections.

Previous discussions on the discontinuation of pgp.cs.uu.nl:

https://lore.kernel.org/all/20201216220110.GA12262@ripley/
https://lore.kernel.org/all/20210812095030.4704-2-sj38.park@gmail.com/

Thank you!

Lukas Wunner (2):
  users: Clean up key ids and e-mail addresses
  yaml-to-kml.py: Link to graphs on kernel.org

 sample.yaml               | 4 ++--
 users/abelloni.yaml       | 2 +-
 users/acme.yaml           | 2 +-
 users/aegl.yaml           | 2 +-
 users/agk.yaml            | 2 +-
 users/aia21.yaml          | 2 +-
 users/amit.yaml           | 2 +-
 users/andrea.yaml         | 2 +-
 users/anibal.yaml         | 2 +-
 users/anna.yaml           | 2 +-
 users/apw.yaml            | 2 +-
 users/arnd.yaml           | 2 +-
 users/asl.yaml            | 2 +-
 users/atenart.yaml        | 2 +-
 users/axboe.yaml          | 2 +-
 users/balbi.yaml          | 2 +-
 users/baohua.yaml         | 2 +-
 users/bcopeland.yaml      | 2 +-
 users/benh.yaml           | 2 +-
 users/bonzini.yaml        | 2 +-
 users/brgl.yaml           | 2 +-
 users/broonie.yaml        | 2 +-
 users/bwh.yaml            | 2 +-
 users/bwidawsk.yaml       | 4 ++--
 users/cdall.yaml          | 2 +-
 users/chanwoo.yaml        | 2 +-
 users/chao.yaml           | 2 +-
 users/chunkuang.hu.yaml   | 2 +-
 users/cmetcalf.yaml       | 2 +-
 users/cohuck.yaml         | 2 +-
 users/colyli.yaml         | 2 +-
 users/daeinki.yaml        | 2 +-
 users/daniel.lezcano.yaml | 2 +-
 users/davej.yaml          | 2 +-
 users/davidb.yaml         | 2 +-
 users/dborkman.yaml       | 2 +-
 users/deller.yaml         | 2 +-
 users/demarchi.yaml       | 2 +-
 users/dirk.yaml           | 2 +-
 users/djiang.yaml         | 2 +-
 users/dtor.yaml           | 2 +-
 users/dvhart.yaml         | 2 +-
 users/dwmw2.yaml          | 2 +-
 users/egrumbach.yaml      | 2 +-
 users/egtvedt.yaml        | 2 +-
 users/eguan.yaml          | 2 +-
 users/elder.yaml          | 2 +-
 users/ericvh.yaml         | 2 +-
 users/eugeneteo.yaml      | 2 +-
 users/evalenti.yaml       | 2 +-
 users/fwestphal.yaml      | 2 +-
 users/galak.yaml          | 2 +-
 users/geert.yaml          | 2 +-
 users/geliang.yaml        | 2 +-
 users/geoff.yaml          | 2 +-
 users/gerg.yaml           | 2 +-
 users/greentime.yaml      | 2 +-
 users/gregkh.yaml         | 2 +-
 users/groeck.yaml         | 2 +-
 users/guoren.yaml         | 2 +-
 users/gustavoars.yaml     | 2 +-
 users/hannes.yaml         | 2 +-
 users/hare.yaml           | 2 +-
 users/helgaas.yaml        | 2 +-
 users/horms.yaml          | 2 +-
 users/hpa.yaml            | 2 +-
 users/hzhuang1.yaml       | 2 +-
 users/ido.yaml            | 2 +-
 users/ilia.lin.yaml       | 2 +-
 users/j.anaszewski.yaml   | 2 +-
 users/jack.yaml           | 2 +-
 users/janc.yaml           | 2 +-
 users/jbarnes.yaml        | 2 +-
 users/jberg.yaml          | 2 +-
 users/jes.yaml            | 2 +-
 users/jforbes.yaml        | 2 +-
 users/jic23.yaml          | 2 +-
 users/jikos.yaml          | 2 +-
 users/jirislaby.yaml      | 2 +-
 users/jkirsher.yaml       | 2 +-
 users/joel.yaml           | 2 +-
 users/joern.yaml          | 2 +-
 users/jolsa.yaml          | 2 +-
 users/jpirko.yaml         | 2 +-
 users/jpoimboe.yaml       | 2 +-
 users/jsalisbury.yaml     | 2 +-
 users/julia.yaml          | 2 +-
 users/junio.yaml          | 2 +-
 users/jwboyer.yaml        | 2 +-
 users/jwessel.yaml        | 2 +-
 users/kbingham.yaml       | 2 +-
 users/kees.yaml           | 2 +-
 users/khilman.yaml        | 2 +-
 users/kishon.yaml         | 2 +-
 users/knsathya.yaml       | 2 +-
 users/konrad.yaml         | 2 +-
 users/kvalo.yaml          | 2 +-
 users/ldesroches.yaml     | 2 +-
 users/ledford.yaml        | 2 +-
 users/lee.yaml            | 2 +-
 users/legion.yaml         | 2 +-
 users/linusw.yaml         | 2 +-
 users/linville.yaml       | 2 +-
 users/lliubbo.yaml        | 2 +-
 users/lorenzo.yaml        | 2 +-
 users/luca.yaml           | 2 +-
 users/luisbg.yaml         | 2 +-
 users/lukas.yaml          | 2 +-
 users/luto.yaml           | 2 +-
 users/mani.yaml           | 2 +-
 users/marex.yaml          | 2 +-
 users/markgross.yaml      | 2 +-
 users/matthias.bgg.yaml   | 2 +-
 users/matttbe.yaml        | 2 +-
 users/maz.yaml            | 2 +-
 users/mbenes.yaml         | 2 +-
 users/mcgrof.yaml         | 2 +-
 users/mchehab.yaml        | 2 +-
 users/mhocko.yaml         | 2 +-
 users/mmind.yaml          | 2 +-
 users/morgan.yaml         | 2 +-
 users/mpe.yaml            | 2 +-
 users/mricon.yaml         | 2 +-
 users/mripard.yaml        | 2 +-
 users/mtk.yaml            | 2 +-
 users/mzx.yaml            | 2 +-
 users/namhyung.yaml       | 2 +-
 users/narmstrong.yaml     | 2 +-
 users/neilb.yaml          | 2 +-
 users/nmenon.yaml         | 2 +-
 users/nsaenz.yaml         | 2 +-
 users/nsekhar.yaml        | 2 +-
 users/ogabbay.yaml        | 2 +-
 users/olof.yaml           | 2 +-
 users/pabeni.yaml         | 2 +-
 users/padovan.yaml        | 2 +-
 users/pateldipen1984.yaml | 2 +-
 users/paulg.yaml          | 2 +-
 users/peterz.yaml         | 2 +-
 users/pi3orama.yaml       | 2 +-
 users/pinchartl.yaml      | 2 +-
 users/plagnioj.yaml       | 2 +-
 users/pmladek.yaml        | 2 +-
 users/qmo.yaml            | 2 +-
 users/radim.yaml          | 2 +-
 users/rafael.yaml         | 2 +-
 users/ralf.yaml           | 2 +-
 users/raven.yaml          | 2 +-
 users/realmz6.yaml        | 2 +-
 users/ribalda.yaml        | 2 +-
 users/rkuo.yaml           | 2 +-
 users/robh.yaml           | 2 +-
 users/roland.yaml         | 2 +-
 users/rostedt.yaml        | 2 +-
 users/rusty.yaml          | 2 +-
 users/rw.yaml             | 2 +-
 users/ryderlee.yaml       | 2 +-
 users/sandeen.yaml        | 2 +-
 users/sashal.yaml         | 2 +-
 users/sboyd.yaml          | 2 +-
 users/seanwang.yaml       | 2 +-
 users/shawnguo.yaml       | 2 +-
 users/shli.yaml           | 2 +-
 users/sj.yaml             | 2 +-
 users/smb.yaml            | 2 +-
 users/sre.yaml            | 2 +-
 users/sumits.yaml         | 2 +-
 users/swarren.yaml        | 2 +-
 users/timur.yaml          | 2 +-
 users/tiwai.yaml          | 2 +-
 users/tobin.yaml          | 2 +-
 users/tyhicks.yaml        | 2 +-
 users/tytso.yaml          | 2 +-
 users/tzungbi.yaml        | 2 +-
 users/vapier.yaml         | 2 +-
 users/vgupta.yaml         | 2 +-
 users/vireshk.yaml        | 2 +-
 users/vishal.yaml         | 2 +-
 users/vkoul.yaml          | 2 +-
 users/wagi.yaml           | 2 +-
 users/wbg.yaml            | 2 +-
 users/wens.yaml           | 2 +-
 users/will.yaml           | 2 +-
 users/wtarreau.yaml       | 2 +-
 users/xiang.yaml          | 2 +-
 users/yinghai.yaml        | 2 +-
 users/zohar.yaml          | 2 +-
 yaml-to-kml.py            | 2 +-
 188 files changed, 190 insertions(+), 190 deletions(-)

-- 
2.43.0

