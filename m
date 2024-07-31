Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1F5A10B
	for <tools@linux.kernel.org>; Wed, 31 Jul 2024 15:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722440080; cv=none; b=aQZG2rPLJUH35mWz0CObAFXUb2KEVW1qoBhnzR0K/aPqOeBnjJIavBj8nbqw1x5PrYKFUHiwMTURWt3Dx/hrqL1+tmc3ZIPEeGIDuVvCmek6JjDrrwy8dQb3yHmjHulZDkZKqVVYxJx1h/+yFRIfV0IXnnHcoO9IrDJoshUw3XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722440080; c=relaxed/simple;
	bh=S0ci9SSc6XaudmTIm1be+IRwheI6K3tx2rCKSthwdYg=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Ld1N0b5PN4eixqhoXTg84bkZlMCZfuI9uVMmI/wNyTC+2roG5NU4sx92v/kLQsiVi/rbAo/IK6WlTnaff3vXe3hrpYsyTN2RmhJaBztofBT9Sd1cFGfFjoJIIfE9T2t5AuN2kL2dMD9ZuiqjK4pU1g23ShFvwzG9eXdrq0fbzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id B3835101E6B81;
	Wed, 31 Jul 2024 17:34:26 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 3AA2A60923DE;
	Wed, 31 Jul 2024 17:34:26 +0200 (CEST)
X-Mailbox-Line: From a8a3945653d2867c4024656a6fe5a9c20b7976f4 Mon Sep 17 00:00:00 2001
Message-ID: <a8a3945653d2867c4024656a6fe5a9c20b7976f4.1722439238.git.lukas@wunner.de>
In-Reply-To: <cover.1722439238.git.lukas@wunner.de>
References: <cover.1722439238.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 31 Jul 2024 17:32:38 +0200
Subject: [PATCH ksmap 2/2] yaml-to-kml.py: Link to graphs on kernel.org
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Ben Widawsky <bwidawsk@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Linus Walleij <linus.walleij@linaro.org>, Matthieu Baerts <matttbe@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Maxime Ripard <mripard@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>

The key ids currently link to pgp.cs.uu.nl, which has been defunct for a
while.  Link to the graphs in the pgpkeys repo on kernel.org instead to
avoid being dependent on 3rd party services.  Developers looking for
signatures may use the graphs to gauge the position of potential signers
in the kernel web of trust.

This requires that key ids are exactly 16 hex characters long to match
filenames in the pgpkeys repo.  Many entries use only 8 hex characters,
a few use 40.  Expand or shorten the key ids as necessary and remove
whitespace.

The following 15 users are not on the kernel keyring, so clicking their
key id will continue to result in an error message:

  agrimberg.yaml
  crq.yaml
  davem.yaml	(*)
  glommer.yaml
  hauke.yaml
  jaegeuk.yaml
  jeremy.yaml	(*)
  jesper.yaml
  jimix.yaml
  jlbec.yaml
  lizf.yaml
  mcoquelin.yaml
  mdomsch.yaml	(*)
  mmarek.yaml
  sage.yaml	(*)

Users marked (*) reference a key id which I could not find on
keyserver.ubuntu.com.  Those key ids might be outdated.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
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
 users/maz.yaml            | 2 +-
 users/mbenes.yaml         | 2 +-
 users/mchehab.yaml        | 2 +-
 users/mhocko.yaml         | 2 +-
 users/mmind.yaml          | 2 +-
 users/morgan.yaml         | 2 +-
 users/mpe.yaml            | 2 +-
 users/mricon.yaml         | 2 +-
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
 181 files changed, 182 insertions(+), 182 deletions(-)

diff --git a/sample.yaml b/sample.yaml
index ee095c1..677adbf 100644
--- a/sample.yaml
+++ b/sample.yaml
@@ -7,8 +7,8 @@ email: 'mricon@kernel.org'
 
 # List the PGP key that you use for kernel.org purposes (the one that
 # carries signatures from other kernel developers). We will link to the
-# key stats page, and may eventually provide our own keystats info.
-key: '329DD07E'
+# key graph in the pgpkeys repository. Use exactly 16 hex characters.
+key: 'E63EDCA9329DD07E'
 
 # You may list as many locations as you like.
 locations:
diff --git a/users/abelloni.yaml b/users/abelloni.yaml
index 88045e7..c714dcf 100644
--- a/users/abelloni.yaml
+++ b/users/abelloni.yaml
@@ -1,5 +1,5 @@
 email: alexandre.belloni@bootlin.com
-key: 6F642CB3
+key: A6CD9F096F642CB3
 locations:
   Lyon, France:
     description: ''
diff --git a/users/acme.yaml b/users/acme.yaml
index 12f83ce..db53074 100644
--- a/users/acme.yaml
+++ b/users/acme.yaml
@@ -1,5 +1,5 @@
 email: acme@infradead.org
-key: 5352AA40
+key: D65016F35352AA40
 locations:
   Maceió, AL:
     description: ''
diff --git a/users/aegl.yaml b/users/aegl.yaml
index f7f09e4..5f4166f 100644
--- a/users/aegl.yaml
+++ b/users/aegl.yaml
@@ -1,5 +1,5 @@
 email: tony.luck@intel.com
-key: 97DF5881
+key: ABAB231F97DF5881
 locations:
   Santa Clara CA 95054:
     description: ''
diff --git a/users/agk.yaml b/users/agk.yaml
index b3895ad..db8db12 100644
--- a/users/agk.yaml
+++ b/users/agk.yaml
@@ -1,5 +1,5 @@
 email: agk@redhat.com
-key: C01E3D67
+key: AD96D6A6C01E3D67
 locations:
   Default Place:
     description: ''
diff --git a/users/aia21.yaml b/users/aia21.yaml
index be27506..cd67bc2 100644
--- a/users/aia21.yaml
+++ b/users/aia21.yaml
@@ -1,5 +1,5 @@
 email: aia21@cam.ac.uk
-key: 5CCA8004
+key: 139D777E5CCA8004
 locations:
   Cambridge, UK:
     description: ''
diff --git a/users/amit.yaml b/users/amit.yaml
index 768eaa5..8bca571 100644
--- a/users/amit.yaml
+++ b/users/amit.yaml
@@ -1,6 +1,6 @@
 name: 'Amit Shah'
 email: 'amit@kernel.org'
-key: '854083B6'
+key: '1E9A3B5F854083B6'
 locations:
   'Dresden':
     latlong: '51.0493286,13.7381437'
diff --git a/users/andrea.yaml b/users/andrea.yaml
index 092d2f6..f6b8134 100644
--- a/users/andrea.yaml
+++ b/users/andrea.yaml
@@ -1,5 +1,5 @@
 email: andrea@kernel.org
-key: 5B51CBCF
+key: C1A460725B51CBCF
 locations:
   Bologna, Italy:
     description: ''
diff --git a/users/anibal.yaml b/users/anibal.yaml
index 4df7f8b..032c124 100644
--- a/users/anibal.yaml
+++ b/users/anibal.yaml
@@ -1,5 +1,5 @@
 email: anibal@kernel.org
-key: 947897D8
+key: 7C56ACFE947897D8
 locations:
   Wheelers Hill, Victoria, Australia:
     description: ''
diff --git a/users/anna.yaml b/users/anna.yaml
index 358a364..813851c 100644
--- a/users/anna.yaml
+++ b/users/anna.yaml
@@ -1,5 +1,5 @@
 email: anna@kernel.org
-key: B0A540EB
+key: D7CB54BFB0A540EB
 locations:
   Ann Arbor, MI, USA:
     description: ''
diff --git a/users/apw.yaml b/users/apw.yaml
index 34a42fa..601114c 100644
--- a/users/apw.yaml
+++ b/users/apw.yaml
@@ -1,6 +1,6 @@
 email: apw@canonical.com
 name: Andy Whitcroft
-key: CB88B08B
+key: 7580CEEBCB88B08B
 locations:
   Dorking, Surrey, UK:
     latlong: 51.23157,-0.33275
diff --git a/users/arnd.yaml b/users/arnd.yaml
index 4661e9c..820f9a0 100644
--- a/users/arnd.yaml
+++ b/users/arnd.yaml
@@ -1,5 +1,5 @@
 email: arnd@arndb.de
-key: C9095227
+key: 60AB47FFC9095227
 locations:
   Tuebingen, DE:
     description: ''
diff --git a/users/asl.yaml b/users/asl.yaml
index 92f2df4..9abe922 100644
--- a/users/asl.yaml
+++ b/users/asl.yaml
@@ -1,6 +1,6 @@
 name: Andrew Lunn
 email: andrew@lunn.ch
-key: A6694C84
+key: E6BF0DCBA6694C84
 locations:
   Saint Paul, MN:
     description: ''
diff --git a/users/atenart.yaml b/users/atenart.yaml
index a1bb583..3bd2cd9 100644
--- a/users/atenart.yaml
+++ b/users/atenart.yaml
@@ -1,5 +1,5 @@
 email: antoine.tenart@bootlin.com
-key: AE8CC723
+key: E9C315B1AE8CC723
 locations:
   Toulouse, France:
     description: ''
diff --git a/users/axboe.yaml b/users/axboe.yaml
index d873d12..2bf89f8 100644
--- a/users/axboe.yaml
+++ b/users/axboe.yaml
@@ -1,5 +1,5 @@
 email: axboe@fb.com
-key: 2971E0A6
+key: F7D358FB2971E0A6
 locations:
   Park City, UT:
     description: ''
diff --git a/users/balbi.yaml b/users/balbi.yaml
index 46c2ecc..5dfee36 100644
--- a/users/balbi.yaml
+++ b/users/balbi.yaml
@@ -1,5 +1,5 @@
 email: balbi@kernel.org
-key: 35CAA444
+key: 868EB2E035CAA444
 locations:
   Default Place:
     description: 'This is where I live.'
diff --git a/users/baohua.yaml b/users/baohua.yaml
index 5f3cd78..ee003dc 100644
--- a/users/baohua.yaml
+++ b/users/baohua.yaml
@@ -1,5 +1,5 @@
 email: baohua@kernel.org
-key: B5F75461
+key: 322FE1A0B5F75461
 locations:
   Shanghai:
     description: ''
diff --git a/users/bcopeland.yaml b/users/bcopeland.yaml
index 02bcc98..ed169a9 100644
--- a/users/bcopeland.yaml
+++ b/users/bcopeland.yaml
@@ -1,5 +1,5 @@
 email: me@bobcopeland.com
-key: 23B2B915
+key: 8411100723B2B915
 locations:
   Toronto, ON, Canada:
     description: ''
diff --git a/users/benh.yaml b/users/benh.yaml
index a3bc955..816d6bb 100644
--- a/users/benh.yaml
+++ b/users/benh.yaml
@@ -1,5 +1,5 @@
 email: benh@kernel.crashing.org
-key: 8B744C5E
+key: 733AD9848B744C5E
 locations:
   Canberra, ACT Australia:
     description: ''
diff --git a/users/bonzini.yaml b/users/bonzini.yaml
index 155f04d..be0aa55 100644
--- a/users/bonzini.yaml
+++ b/users/bonzini.yaml
@@ -1,5 +1,5 @@
 email: bonzini@kernel.org
-key: CD3669B1
+key: 7E15100CCD3669B1
 locations:
   Milan, Italy:
     description: ''
diff --git a/users/brgl.yaml b/users/brgl.yaml
index bde103e..4885245 100644
--- a/users/brgl.yaml
+++ b/users/brgl.yaml
@@ -1,6 +1,6 @@
 name: 'Bartosz Golaszewski'
 email: 'bartekgola@gmail.com'
-key: '1471D772'
+key: '11A72EA01471D772'
 locations:
     'Antibes, France':
         latlong: '43.5836,7.10905'
diff --git a/users/broonie.yaml b/users/broonie.yaml
index 524f773..2f86158 100644
--- a/users/broonie.yaml
+++ b/users/broonie.yaml
@@ -1,5 +1,5 @@
 email: broonie@kernel.org
-key: 30F5D8EB
+key: C3F436CA30F5D8EB
 locations:
   Default Place:
     description: ''
diff --git a/users/bwh.yaml b/users/bwh.yaml
index 917fae4..19c69de 100644
--- a/users/bwh.yaml
+++ b/users/bwh.yaml
@@ -1,5 +1,5 @@
 email: ben@decadent.org.uk
-key: 95861109
+key: E7BFC8EC95861109
 locations:
   Cambridge, UK:
     description: ''
diff --git a/users/cdall.yaml b/users/cdall.yaml
index 04a92dc..f04a5f1 100644
--- a/users/cdall.yaml
+++ b/users/cdall.yaml
@@ -1,5 +1,5 @@
 email: christoffer.dall@linaro.org
-key: EDE9D772
+key: 4B693A2CEDE9D772
 locations:
   Default Place:
     description: ''
diff --git a/users/chanwoo.yaml b/users/chanwoo.yaml
index 1023d45..5f15850 100644
--- a/users/chanwoo.yaml
+++ b/users/chanwoo.yaml
@@ -1,5 +1,5 @@
 email: cw00.choi@samsung.com
-key: DEEBCF53
+key: 9CCDDF2CDEEBCF53
 locations:
   Seoul, Korea, KR:
     description: ''
diff --git a/users/chao.yaml b/users/chao.yaml
index ff1e9ae..002d9c1 100644
--- a/users/chao.yaml
+++ b/users/chao.yaml
@@ -1,5 +1,5 @@
 email: chao@kernel.org
-key: 7FA79D86
+key: A4CF801D7FA79D86
 locations:
   Nanjing, Jiangsu, China:
     description: ''
diff --git a/users/chunkuang.hu.yaml b/users/chunkuang.hu.yaml
index dcd87ff..1ead549 100644
--- a/users/chunkuang.hu.yaml
+++ b/users/chunkuang.hu.yaml
@@ -8,7 +8,7 @@ email: 'chunkuang.hu@kernel.org'
 # List the PGP key that you use for kernel.org purposes (the one that
 # carries signatures from other kernel developers). We will link to the
 # key stats page, and may eventually provide our own keystats info.
-key: 'c9594e24'
+key: 'E1CA73A3C9594E24'
 
 # You may list as many locations as you like.
 locations:
diff --git a/users/cmetcalf.yaml b/users/cmetcalf.yaml
index 3bd8d7c..fe81727 100644
--- a/users/cmetcalf.yaml
+++ b/users/cmetcalf.yaml
@@ -1,5 +1,5 @@
 email: cmetcalf@tilera.com
-key: AFF574C0
+key: 5C82089AAFF574C0
 locations:
   Wellesley, MA:
     description: ''
diff --git a/users/cohuck.yaml b/users/cohuck.yaml
index 2c0af81..27ef148 100644
--- a/users/cohuck.yaml
+++ b/users/cohuck.yaml
@@ -1,6 +1,6 @@
 name: 'Cornelia Huck'
 email: 'cohuck@kernel.org'
-key: 'C6F02FAF'
+key: 'DECF6B93C6F02FAF'
 locations:
     'Stuttgart':
         latlong: '48.77919575,9.1928044337031'
diff --git a/users/colyli.yaml b/users/colyli.yaml
index a623b8d..db25966 100644
--- a/users/colyli.yaml
+++ b/users/colyli.yaml
@@ -1,5 +1,5 @@
 email: colyli@suse.de 
-key: 6B7DF8FC
+key: C73907936B7DF8FC
 locations:
   Beijing, China:
     description: ''
diff --git a/users/daeinki.yaml b/users/daeinki.yaml
index 09bb862..74fd087 100644
--- a/users/daeinki.yaml
+++ b/users/daeinki.yaml
@@ -1,5 +1,5 @@
 email: inki.dae@samsung.com
-key: 0C4312B8
+key: 573834890C4312B8
 locations:
   Suwon, Korea:
     description: ''
diff --git a/users/daniel.lezcano.yaml b/users/daniel.lezcano.yaml
index 3ee6e01..d020204 100644
--- a/users/daniel.lezcano.yaml
+++ b/users/daniel.lezcano.yaml
@@ -8,7 +8,7 @@ email: 'daniel.lezcano@kernel.org'
 # List the PGP key that you use for kernel.org purposes (the one that
 # carries signatures from other kernel developers). We will link to the
 # key stats page, and may eventually provide our own keystats info.
-key: '71675527'
+key: '8FF4B8D271675527'
 
 # You may list as many locations as you like.
 locations:
diff --git a/users/davej.yaml b/users/davej.yaml
index ba40a1b..00948ba 100644
--- a/users/davej.yaml
+++ b/users/davej.yaml
@@ -1,5 +1,5 @@
 email: davej@redhat.com
-key: A2DE2552
+key: B0CB3F9FA2DE2552
 locations:
   Default Place:
     description: ''
diff --git a/users/davidb.yaml b/users/davidb.yaml
index be2de0c..efacb73 100644
--- a/users/davidb.yaml
+++ b/users/davidb.yaml
@@ -1,5 +1,5 @@
 email: davidb@codeaurora.org
-key: 5E54DF82
+key: E6BA9F5C5E54DF82
 locations:
   San Diego, CA USA:
     description: ''
diff --git a/users/dborkman.yaml b/users/dborkman.yaml
index f8cb4a7..59cc21a 100644
--- a/users/dborkman.yaml
+++ b/users/dborkman.yaml
@@ -1,6 +1,6 @@
 name: 'Daniel Borkmann'
 email: 'daniel@iogearbox.net'
-key: '364A71D8'
+key: '2BF88B2A364A71D8'
 locations:
     'Bern, Switzerland':
         latlong: '46.946550,7.443933'
diff --git a/users/deller.yaml b/users/deller.yaml
index 4fedcd2..9eda531 100644
--- a/users/deller.yaml
+++ b/users/deller.yaml
@@ -1,5 +1,5 @@
 email: deller@gmx.de
-key: B51E3864
+key: 87C9C151B51E3864
 locations:
    Wiesloch, Germany:
      description: ''
diff --git a/users/demarchi.yaml b/users/demarchi.yaml
index c7e3057..4132075 100644
--- a/users/demarchi.yaml
+++ b/users/demarchi.yaml
@@ -1,5 +1,5 @@
 email: lucas.de.marchi@gmail.com
-key: 30CBEA53
+key: 9BA2A5A630CBEA53
 locations:
   Campinas, SP:
     description: ''
diff --git a/users/dirk.yaml b/users/dirk.yaml
index fa54c60..1388535 100644
--- a/users/dirk.yaml
+++ b/users/dirk.yaml
@@ -1,5 +1,5 @@
 email: dirk@hohndel.org
-key: DF188DFE
+key: C83B0745DF188DFE
 locations:
   Multnomah Village:
     description: I only sign keys of people that I have had some interactions with
diff --git a/users/djiang.yaml b/users/djiang.yaml
index 06aafe8..ee45ab7 100644
--- a/users/djiang.yaml
+++ b/users/djiang.yaml
@@ -1,5 +1,5 @@
 email: dave.jiang@intel.com
-key: 6953384A
+key: 6068C5166953384A
 locations:
   Chandler, AZ:
     description: ''
diff --git a/users/dtor.yaml b/users/dtor.yaml
index 9b96851..c3f9ed7 100644
--- a/users/dtor.yaml
+++ b/users/dtor.yaml
@@ -1,5 +1,5 @@
 email: dmitry.torokhov@gmail.com
-key: 2BE9962A
+key: 7EF4F96F2BE9962A
 locations:
   Mountain View, CA 94040:
     description: ''
diff --git a/users/dvhart.yaml b/users/dvhart.yaml
index 4c29f54..b1e9b49 100644
--- a/users/dvhart.yaml
+++ b/users/dvhart.yaml
@@ -1,5 +1,5 @@
 email: darren@dvhart.com
-key: 0AA77EB8
+key: A6CC680C0AA77EB8
 locations:
   Portland, OR:
     description: ''
diff --git a/users/dwmw2.yaml b/users/dwmw2.yaml
index 3cdad9b..0baf697 100644
--- a/users/dwmw2.yaml
+++ b/users/dwmw2.yaml
@@ -1,5 +1,5 @@
 email: dwmw2@infradead.org
-key: 67E2F359
+key: 63762CDA67E2F359
 locations:
   Braintree, Essex:
     description: ''
diff --git a/users/egrumbach.yaml b/users/egrumbach.yaml
index c1ca9b8..f86e204 100644
--- a/users/egrumbach.yaml
+++ b/users/egrumbach.yaml
@@ -1,5 +1,5 @@
 email: egrumbach@gmail.com
-key: 6E363201
+key: 2D0B96FE6E363201
 locations:
   Jerusalem, IL:
     description: ''
diff --git a/users/egtvedt.yaml b/users/egtvedt.yaml
index bff88dd..bbe48c2 100644
--- a/users/egtvedt.yaml
+++ b/users/egtvedt.yaml
@@ -1,5 +1,5 @@
 email: egtvedt@samfundet.no
-key: 2BC0FB0D
+key: 6D4631782BC0FB0D
 locations:
   Oslo, Norway:
     description: ''
diff --git a/users/eguan.yaml b/users/eguan.yaml
index aee0501..5660322 100644
--- a/users/eguan.yaml
+++ b/users/eguan.yaml
@@ -1,5 +1,5 @@
 email: eguan@redhat.com
-key: 5C8FE763
+key: 2652AA295C8FE763
 locations:
   Beijing, China:
     description: ''
diff --git a/users/elder.yaml b/users/elder.yaml
index bc7a229..8ef2911 100644
--- a/users/elder.yaml
+++ b/users/elder.yaml
@@ -1,5 +1,5 @@
 email: elder@kernel.org
-key: 2FF9F435
+key: 7CD1E6192FF9F435
 locations:
   Shoreview, MN:
     description: ''
diff --git a/users/ericvh.yaml b/users/ericvh.yaml
index dc9809a..880ee45 100644
--- a/users/ericvh.yaml
+++ b/users/ericvh.yaml
@@ -1,5 +1,5 @@
 email: ericvh@gmail.com
-key: 0845A4CE
+key: 6435C9050845A4CE
 locations:
   Austin, TX:
     description: ''
diff --git a/users/eugeneteo.yaml b/users/eugeneteo.yaml
index 88391c8..be95b0c 100644
--- a/users/eugeneteo.yaml
+++ b/users/eugeneteo.yaml
@@ -1,5 +1,5 @@
 email: eugeneteo@kernel.org
-key: CC8D8E16
+key: 2F0B37F9CC8D8E16
 locations:
   Singapore:
     description: ''
diff --git a/users/evalenti.yaml b/users/evalenti.yaml
index 7215291..62b8438 100644
--- a/users/evalenti.yaml
+++ b/users/evalenti.yaml
@@ -1,5 +1,5 @@
 email: evalenti@kernel.org
-key: 3F70F398
+key: 256941193F70F398
 locations:
   Pleasanton, CA. USA:
     description: ''
diff --git a/users/fwestphal.yaml b/users/fwestphal.yaml
index f1d6dfd..796db56 100644
--- a/users/fwestphal.yaml
+++ b/users/fwestphal.yaml
@@ -1,6 +1,6 @@
 name: 'Florian Westphal'
 email: 'fw@strlen.de'
-key: 'AD5FF600'
+key: '7091A8D9AD5FF600'
 locations:
     # The names of the cities are purely for your reference.
     'Freiburg im Breisgau':
diff --git a/users/galak.yaml b/users/galak.yaml
index fc5d9f0..8bd6735 100644
--- a/users/galak.yaml
+++ b/users/galak.yaml
@@ -1,5 +1,5 @@
 email: galak@kernel.crashing.org
-key: 4CD1D988
+key: 18AD36B54CD1D988
 locations:
   Austin, TX:
     description: ''
diff --git a/users/geert.yaml b/users/geert.yaml
index 83c1ec0..c082261 100644
--- a/users/geert.yaml
+++ b/users/geert.yaml
@@ -1,5 +1,5 @@
 email: geert@linux-m68k.org
-key: 3F55EEFB
+key: 4804B4BC3F55EEFB
 locations:
   Aarschot, BE:
     description: ''
diff --git a/users/geliang.yaml b/users/geliang.yaml
index 8f099ca..7041930 100644
--- a/users/geliang.yaml
+++ b/users/geliang.yaml
@@ -1,6 +1,6 @@
 name: 'Geliang Tang'
 email: 'geliang@kernel.org'
-key: '318AA829'
+key: '7E7BED35318AA829'
 
 locations:
     'Beijing, China':
diff --git a/users/geoff.yaml b/users/geoff.yaml
index e7127fc..f03d0b1 100644
--- a/users/geoff.yaml
+++ b/users/geoff.yaml
@@ -1,5 +1,5 @@
 email: geoff@infradead.org
-key: ED7F924E
+key: 171B27A8ED7F924E
 locations:
   Huawei, Santa Clara, CA:
     description: ''
diff --git a/users/gerg.yaml b/users/gerg.yaml
index 1143404..87f01a9 100644
--- a/users/gerg.yaml
+++ b/users/gerg.yaml
@@ -1,5 +1,5 @@
 email: gerg@kernel.org
-key: A1BD2F80
+key: 4E2415A9A1BD2F80
 locations:
   Brisbane, QLD, Australia:
     description: ''
diff --git a/users/greentime.yaml b/users/greentime.yaml
index e2b5d82..d14a16c 100644
--- a/users/greentime.yaml
+++ b/users/greentime.yaml
@@ -1,5 +1,5 @@
 email: greentime@kernel.org
-key: D94797F5
+key: 0B134119D94797F5
 locations:
   Hsinchu, TW:
     description: 'I can sign your key in Hsinchu or Tainan(sometimes).'
diff --git a/users/gregkh.yaml b/users/gregkh.yaml
index be027e9..714e4bc 100644
--- a/users/gregkh.yaml
+++ b/users/gregkh.yaml
@@ -1,5 +1,5 @@
 email: greg@kroah.com
-key: 6092693E
+key: 38DBBDC86092693E
 locations:
   'Den Haag, Netherlands':
     description: ''
diff --git a/users/groeck.yaml b/users/groeck.yaml
index 1151805..9b99c04 100644
--- a/users/groeck.yaml
+++ b/users/groeck.yaml
@@ -1,5 +1,5 @@
 email: linux@roeck-us.net
-key: CE9F9981
+key: CB1F266FCE9F9981
 locations:
   San Jose, CA:
     description: ''
diff --git a/users/guoren.yaml b/users/guoren.yaml
index 2ef2f27..e3ac3a4 100644
--- a/users/guoren.yaml
+++ b/users/guoren.yaml
@@ -1,5 +1,5 @@
 email: guoren@kernel.org
-key: 323C69AF
+key: 7E7F91E0323C69AF
 locations:
   Hangzhou, Zhe Jiang, China:
     description: 'I can sign your key in Hangzhou.'
diff --git a/users/gustavoars.yaml b/users/gustavoars.yaml
index ad67f73..7714de8 100644
--- a/users/gustavoars.yaml
+++ b/users/gustavoars.yaml
@@ -1,5 +1,5 @@
 email: gustavo@embeddedor.com
-key: 4706DB31
+key: 4705B4CB4706DB31
 locations:
   Oaxaca, Mexico:
     description: ''
diff --git a/users/hannes.yaml b/users/hannes.yaml
index f6852cd..31ad590 100644
--- a/users/hannes.yaml
+++ b/users/hannes.yaml
@@ -1,5 +1,5 @@
 email: hannes@cmpxchg.org
-key: DE62FE87
+key: 716A0F50DE62FE87
 locations:
   Default Place:
     description: ''
diff --git a/users/hare.yaml b/users/hare.yaml
index 9dab3c7..28588f5 100644
--- a/users/hare.yaml
+++ b/users/hare.yaml
@@ -1,5 +1,5 @@
 email: hare@suse.de
-key: 4EC8A8CF
+key: 6CF8CA2F4EC8A8CF
 locations:
   Nuremberg, Germany:
     description: ''
diff --git a/users/helgaas.yaml b/users/helgaas.yaml
index 1dd6235..5f12222 100644
--- a/users/helgaas.yaml
+++ b/users/helgaas.yaml
@@ -1,5 +1,5 @@
 email: bhelgaas@google.com
-key: 7B1E7EB3
+key: F18C388F7B1E7EB3
 locations:
   Springfield, MO:
     description: ''
diff --git a/users/horms.yaml b/users/horms.yaml
index ff404e1..a1991c7 100644
--- a/users/horms.yaml
+++ b/users/horms.yaml
@@ -1,5 +1,5 @@
 email: horms@verge.net.au
-key: 6A374FBE
+key: D7CF64696A374FBE
 locations:
   Kobe, Japan:
     description: ''
diff --git a/users/hzhuang1.yaml b/users/hzhuang1.yaml
index b97ed8e..52120fe 100644
--- a/users/hzhuang1.yaml
+++ b/users/hzhuang1.yaml
@@ -1,5 +1,5 @@
 email: haojian.zhuang@gmail.com
-key: DCFA2BF6
+key: B5DB5D8FDCFA2BF6
 locations:
   Shanghai China:
     description: ''
diff --git a/users/ido.yaml b/users/ido.yaml
index d12fbf1..8719a7e 100644
--- a/users/ido.yaml
+++ b/users/ido.yaml
@@ -1,6 +1,6 @@
 name: 'Ido Rosen'
 email: 'ido@kernel.org'
-key: '2389BB21'
+key: 'A669D0002389BB21'
 locations:
     'Vallejo, CA':
         description: >
diff --git a/users/ilia.lin.yaml b/users/ilia.lin.yaml
index 301387d..e1e0ed4 100644
--- a/users/ilia.lin.yaml
+++ b/users/ilia.lin.yaml
@@ -1,5 +1,5 @@
 email: ilia.lin@kernel.org
-key: A8C05447
+key: F449AE44A8C05447
 locations:
   Haifa, IL:
     description: ''
diff --git a/users/j.anaszewski.yaml b/users/j.anaszewski.yaml
index 4e05672..d01e732 100644
--- a/users/j.anaszewski.yaml
+++ b/users/j.anaszewski.yaml
@@ -1,6 +1,6 @@
 name: 'Jacek Anaszewski'
 email: 'j.anaszewski@samsung.com'
-key: 'B78B7C26'
+key: 'BD6A501CB78B7C26'
 
 locations:
     'Warsaw, Poland':
diff --git a/users/jack.yaml b/users/jack.yaml
index 92a202d..1496a01 100644
--- a/users/jack.yaml
+++ b/users/jack.yaml
@@ -1,5 +1,5 @@
 email: jack@suse.cz
-key: 43038D8C
+key: 15BC833443038D8C
 locations:
   Jindrichovice pod Smrkem, Czech Republic:
     description: ''
diff --git a/users/janc.yaml b/users/janc.yaml
index da617c9..50be210 100644
--- a/users/janc.yaml
+++ b/users/janc.yaml
@@ -1,5 +1,5 @@
 email: szymon.janc@gmail.com
-key: 5F0AFE3F
+key: 130387AC5F0AFE3F
 locations:
   Wroclaw, Poland:
     description: ''
diff --git a/users/jbarnes.yaml b/users/jbarnes.yaml
index c7bb2f8..8926127 100644
--- a/users/jbarnes.yaml
+++ b/users/jbarnes.yaml
@@ -1,5 +1,5 @@
 email: jbarnes@virtuousgeek.org
-key: 916BCA39
+key: C93A8F10916BCA39
 locations:
   Sebastopol, CA:
     description: ''
diff --git a/users/jberg.yaml b/users/jberg.yaml
index 9553497..ba6274d 100644
--- a/users/jberg.yaml
+++ b/users/jberg.yaml
@@ -1,5 +1,5 @@
 email: johannes@sipsolutions.net
-key: 7BF9099A
+key: E0F373F37BF9099A
 locations:
   Detmold:
     description: ''
diff --git a/users/jes.yaml b/users/jes.yaml
index 33ce3b0..72c134f 100644
--- a/users/jes.yaml
+++ b/users/jes.yaml
@@ -1,5 +1,5 @@
 email: Jes.Sorensen@gmail.com
-key: 531A9C91
+key: 397D82E0531A9C91
 locations:
   Default Place:
     description: ''
diff --git a/users/jforbes.yaml b/users/jforbes.yaml
index 362e9bd..8629903 100644
--- a/users/jforbes.yaml
+++ b/users/jforbes.yaml
@@ -1,5 +1,5 @@
 email: jmforbes@linuxtx.org
-key: 07D2F8B4
+key: E0D3C9EF07D2F8B4
 locations:
   Allen, TX:
     description: ''
diff --git a/users/jic23.yaml b/users/jic23.yaml
index 66a38a4..b337207 100644
--- a/users/jic23.yaml
+++ b/users/jic23.yaml
@@ -1,5 +1,5 @@
 email: jic23@kernel.org
-key: C4F41688
+key: 54853499C4F41688
 locations:
   UK:
     description: ''
diff --git a/users/jikos.yaml b/users/jikos.yaml
index cef938e..1012c29 100644
--- a/users/jikos.yaml
+++ b/users/jikos.yaml
@@ -1,5 +1,5 @@
 email: jkosina@suse.cz
-key: 6BED6049
+key: A662F38F6BED6049
 locations:
   Default Place:
     description: ''
diff --git a/users/jirislaby.yaml b/users/jirislaby.yaml
index aa77002..f025c5f 100644
--- a/users/jirislaby.yaml
+++ b/users/jirislaby.yaml
@@ -1,5 +1,5 @@
 email: jirislaby@gmail.com
-key: 06B47049
+key: BD25B10406B47049
 locations:
   Prostejov, Czech Republic:
     description: ''
diff --git a/users/jkirsher.yaml b/users/jkirsher.yaml
index 03a8875..5e0c015 100644
--- a/users/jkirsher.yaml
+++ b/users/jkirsher.yaml
@@ -1,5 +1,5 @@
 email: jeffrey.t.kirsher@intel.com
-key: 5A4BEDCE
+key: E56FEF955A4BEDCE
 locations:
   King City, OR:
     description: ''
diff --git a/users/joel.yaml b/users/joel.yaml
index 23f627b..980dbdd 100644
--- a/users/joel.yaml
+++ b/users/joel.yaml
@@ -1,6 +1,6 @@
 name: Joel Stanley
 email: joel at jms.id.au
-key: FA71 CC02 DF4F 0810 C7EB  7C01 6B76 5907 8147 709E
+key: 6B7659078147709E
 locations:
   Adelaide:
     description: ''
diff --git a/users/joern.yaml b/users/joern.yaml
index fe0468a..87e2e65 100644
--- a/users/joern.yaml
+++ b/users/joern.yaml
@@ -1,5 +1,5 @@
 email: joern@logfs.org
-key: 56F28814
+key: FAF3337956F28814
 locations:
   Mountain View, CA, USA:
     description: ''
diff --git a/users/jolsa.yaml b/users/jolsa.yaml
index b1424d4..90521f6 100644
--- a/users/jolsa.yaml
+++ b/users/jolsa.yaml
@@ -1,5 +1,5 @@
 email: jolsa@kernel.org
-key: 56077B3D
+key: F66A512056077B3D
 locations:
   Brno, Czech Republic:
     description: ''
diff --git a/users/jpirko.yaml b/users/jpirko.yaml
index cbe9038..60432ab 100644
--- a/users/jpirko.yaml
+++ b/users/jpirko.yaml
@@ -1,5 +1,5 @@
 email: jiri@resnulli.us
-key: 6E4E387D
+key: 526A3E2C6E4E387D
 locations:
   Choceň, Czech Republic:
     description: ''
diff --git a/users/jpoimboe.yaml b/users/jpoimboe.yaml
index 82efdca..df6e175 100644
--- a/users/jpoimboe.yaml
+++ b/users/jpoimboe.yaml
@@ -1,6 +1,6 @@
 name: 'Josh Poimboeuf'
 email: 'jpoimboe@redhat.com'
-key: '43932B05'
+key: '282787F243932B05'
 locations:
     'Davis, CA':
         latlong: '38.545379,-121.744583'
diff --git a/users/jsalisbury.yaml b/users/jsalisbury.yaml
index c90f1dd..b691b38 100644
--- a/users/jsalisbury.yaml
+++ b/users/jsalisbury.yaml
@@ -1,5 +1,5 @@
 email: jsalisbury@kernel.org
-key: CA5B141E
+key: 6CEF3D27CA5B141E
 locations:
   Default Place:
     description: Southern NH
diff --git a/users/julia.yaml b/users/julia.yaml
index 927a12a..9ec1b5e 100644
--- a/users/julia.yaml
+++ b/users/julia.yaml
@@ -1,5 +1,5 @@
 email: juliac@eso.teric.us
-key: 23EEDD5F
+key: 0A120DD923EEDD5F
 locations:
   North Austin, Texas:
     description: ''
diff --git a/users/junio.yaml b/users/junio.yaml
index e3d4eb5..e95d3ad 100644
--- a/users/junio.yaml
+++ b/users/junio.yaml
@@ -1,5 +1,5 @@
 email: gitster@pobox.com
-key: 713660A7
+key: 20D04E5A713660A7
 locations:
   Mountain View, CA:
     description: ''
diff --git a/users/jwboyer.yaml b/users/jwboyer.yaml
index 1d7ed98..bb00970 100644
--- a/users/jwboyer.yaml
+++ b/users/jwboyer.yaml
@@ -1,5 +1,5 @@
 email: jwboyer@gmail.com
-key: 2486CFD6
+key: A31B6BD72486CFD6
 locations:
   Grand Rapids, MI:
     description: ''
diff --git a/users/jwessel.yaml b/users/jwessel.yaml
index bfc8798..5573ee1 100644
--- a/users/jwessel.yaml
+++ b/users/jwessel.yaml
@@ -1,5 +1,5 @@
 email: jason.wessel@windriver.com
-key: 5E7693A3
+key: 87223A575E7693A3
 locations:
   Downers Grove, IL:
     description: ''
diff --git a/users/kbingham.yaml b/users/kbingham.yaml
index 9e8c904..c159c5a 100644
--- a/users/kbingham.yaml
+++ b/users/kbingham.yaml
@@ -1,7 +1,7 @@
 # A little about me
 name: 'Kieran Bingham'
 email: 'kbingham@kernel.org'
-key: '831DB2B1'
+key: '23863DC3831DB2B1'
 
 # Where to find me
 locations:
diff --git a/users/kees.yaml b/users/kees.yaml
index cdb59ca..2eaa2da 100644
--- a/users/kees.yaml
+++ b/users/kees.yaml
@@ -1,5 +1,5 @@
 email: kees@outflux.net
-key: DC6DC026
+key: 8972F4DFDC6DC026
 locations:
   Portland, OR:
     description: ''
diff --git a/users/khilman.yaml b/users/khilman.yaml
index 0f7b8b6..01dbc23 100644
--- a/users/khilman.yaml
+++ b/users/khilman.yaml
@@ -1,5 +1,5 @@
 email: khilman@kernel.org
-key: D3FBC665
+key: 5937189AD3FBC665
 locations:
   Seattle, WA 98125:
     description: ''
diff --git a/users/kishon.yaml b/users/kishon.yaml
index fde6a65..b75166b 100644
--- a/users/kishon.yaml
+++ b/users/kishon.yaml
@@ -1,5 +1,5 @@
 email: kishon@ti.com
-key: 804D82D9
+key: 0E5C785C804D82D9
 locations:
   Default Place:
     description: ''
diff --git a/users/knsathya.yaml b/users/knsathya.yaml
index bd69b12..9cecfbb 100644
--- a/users/knsathya.yaml
+++ b/users/knsathya.yaml
@@ -1,5 +1,5 @@
 email: knsathya@kernel.org
-key: A2A3EB9F
+key: 6CF98D11A2A3EB9F
 locations:
   Hillsboro OR 97124:
     description: ''
diff --git a/users/konrad.yaml b/users/konrad.yaml
index 85a11f4..d10666f 100644
--- a/users/konrad.yaml
+++ b/users/konrad.yaml
@@ -1,5 +1,5 @@
 email: konrad@kernel.org
-key: F1DB09BF
+key: 52A50E84F1DB09BF
 locations:
   Boston, MA:
     description: ''
diff --git a/users/kvalo.yaml b/users/kvalo.yaml
index 25f41a4..cf9e967 100644
--- a/users/kvalo.yaml
+++ b/users/kvalo.yaml
@@ -1,6 +1,6 @@
 name: Kalle Valo
 email: kvalo@codeaurora.org
-key: 26EB6D9B
+key: 6E17245526EB6D9B
 locations:
     Tampere, Finland:
         latlong: 61.4980214,23.7603118
diff --git a/users/ldesroches.yaml b/users/ldesroches.yaml
index b1ac3d0..d6941ed 100644
--- a/users/ldesroches.yaml
+++ b/users/ldesroches.yaml
@@ -1,5 +1,5 @@
 email: ludovic.desroches@microchip.com
-key: 09DCC11A
+key: E332995F09DCC11A
 locations:
   Eguilles, France:
     description: ''
diff --git a/users/ledford.yaml b/users/ledford.yaml
index a6294b8..7c31a7a 100644
--- a/users/ledford.yaml
+++ b/users/ledford.yaml
@@ -1,5 +1,5 @@
 email: dledford@xsintricity.com
-key: 0E572FDD
+key: B826A3330E572FDD
 locations:
   Morrisville, NC 27560:
     description: ''
diff --git a/users/lee.yaml b/users/lee.yaml
index 229ec54..0e8530a 100644
--- a/users/lee.yaml
+++ b/users/lee.yaml
@@ -1,5 +1,5 @@
 email: lee.jones@linaro.org
-key: 87FC7761
+key: 51AF8A2F87FC7761
 locations:
   Bristol:
     description: ''
diff --git a/users/legion.yaml b/users/legion.yaml
index 0955a92..f0d17de 100644
--- a/users/legion.yaml
+++ b/users/legion.yaml
@@ -1,5 +1,5 @@
 email: gladkov.alexey@gmail.com
-key: 4CFFD434
+key: A45ABA544CFFD434
 locations:
   Moscow, Russia:
     description: ''
diff --git a/users/linville.yaml b/users/linville.yaml
index 2165866..4bc1f46 100644
--- a/users/linville.yaml
+++ b/users/linville.yaml
@@ -1,5 +1,5 @@
 email: linville@tuxdriver.com
-key: DC613806
+key: 972D5BF4DC613806
 locations:
   Mebane, NC 27302:
     description: ''
diff --git a/users/lliubbo.yaml b/users/lliubbo.yaml
index c26796d..15e64ef 100644
--- a/users/lliubbo.yaml
+++ b/users/lliubbo.yaml
@@ -1,5 +1,5 @@
 email: lliubbo@kernel.org
-key: 7DAA56C9
+key: 5D5CAB617DAA56C9
 locations:
   ShangHai, China:
     description: ''
diff --git a/users/lorenzo.yaml b/users/lorenzo.yaml
index 57496e3..d2a09bd 100644
--- a/users/lorenzo.yaml
+++ b/users/lorenzo.yaml
@@ -1,5 +1,5 @@
 email: lorenzo@kernel.org
-key: A06E022E
+key: 1A53BC68A06E022E
 locations:
   Milan, Italy:
     description: ''
diff --git a/users/luca.yaml b/users/luca.yaml
index 890529b..2052478 100644
--- a/users/luca.yaml
+++ b/users/luca.yaml
@@ -1,5 +1,5 @@
 email: luca@coelho.fi
-key: 1A3CC5FA
+key: A1479CA21A3CC5FA
 locations:
   Vantaa, Finland:
     description: ''
diff --git a/users/luisbg.yaml b/users/luisbg.yaml
index 588a855..2f1c132 100644
--- a/users/luisbg.yaml
+++ b/users/luisbg.yaml
@@ -1,5 +1,5 @@
 email: luisbg@kernel.org
-key: 873B518D
+key: 6BBF9F19873B518D
 locations:
   London (SW11), United Kingdom:
     description: 'Available in South-West London during evenings and weekends.'
diff --git a/users/lukas.yaml b/users/lukas.yaml
index e7ff033..432c8a7 100644
--- a/users/lukas.yaml
+++ b/users/lukas.yaml
@@ -1,6 +1,6 @@
 name: Lukas Wunner
 email: lukas@wunner.de
-key: F1F0F8C2362BDC879A2964BA3B1BBD6BB613204B
+key: 3B1BBD6BB613204B
 locations:
     Tübingen:
         latlong: 48.5202801,9.0537148
diff --git a/users/luto.yaml b/users/luto.yaml
index 5a30136..2ac30c4 100644
--- a/users/luto.yaml
+++ b/users/luto.yaml
@@ -1,5 +1,5 @@
 email: luto@amacapital.net
-key: C51622D3
+key: 002BA651C51622D3
 locations:
   Default Place:
     description: ''
diff --git a/users/mani.yaml b/users/mani.yaml
index 5aafcb8..0d6d8d3 100644
--- a/users/mani.yaml
+++ b/users/mani.yaml
@@ -1,5 +1,5 @@
 email: mani@kernel.org
-key: '01166008'
+key: '488550E901166008'
 locations:
   Erode, TN, India:
     description: 'I can sign keys in Erode area.
diff --git a/users/marex.yaml b/users/marex.yaml
index 65792ad..13a681f 100644
--- a/users/marex.yaml
+++ b/users/marex.yaml
@@ -1,5 +1,5 @@
 email: marek.vasut@gmail.com
-key: 8D3967C9
+key: 9509E0158D3967C9
 locations:
   Default Place:
     description: ''
diff --git a/users/markgross.yaml b/users/markgross.yaml
index 07fd82a..cf00c7a 100644
--- a/users/markgross.yaml
+++ b/users/markgross.yaml
@@ -1,5 +1,5 @@
 email: mark97229@gmail.com
-key: A31A1C17
+key: F92D73C9A31A1C17
 locations:
   Default Place:
     description: I live a 20 min walk from here.  The starbucks on this corner is
diff --git a/users/matthias.bgg.yaml b/users/matthias.bgg.yaml
index bd6994c..28cfa64 100644
--- a/users/matthias.bgg.yaml
+++ b/users/matthias.bgg.yaml
@@ -8,7 +8,7 @@ email: 'matthias.bgg@gmail.com'
 # List the PGP key that you use for kernel.org purposes (the one that
 # carries signatures from other kernel developers). We will link to the
 # key stats page, and may eventually provide our own keystats info.
-key: '561302F1'
+key: 'D9140BB2561302F1'
 
 # You may list as many locations as you like.
 locations:
diff --git a/users/maz.yaml b/users/maz.yaml
index c2563cf..9d1bb99 100644
--- a/users/maz.yaml
+++ b/users/maz.yaml
@@ -1,5 +1,5 @@
 email: maz@kernel.org
-key: D13D7A43
+key: 23D0D0BAD13D7A43
 locations:
   Cambridge, CB1 2LL, UK:
     description: ''
diff --git a/users/mbenes.yaml b/users/mbenes.yaml
index ad58741..75ba418 100644
--- a/users/mbenes.yaml
+++ b/users/mbenes.yaml
@@ -1,5 +1,5 @@
 email: mbenes@kernel.org
-key: A80834DA
+key: FF98A38DA80834DA
 locations:
   Prague, Czech Republic:
     description: ''
diff --git a/users/mchehab.yaml b/users/mchehab.yaml
index bd9f131..fcf4d1f 100644
--- a/users/mchehab.yaml
+++ b/users/mchehab.yaml
@@ -1,5 +1,5 @@
 email: m.chehab@samsung.com
-key: 7F3C42E7
+key: 63B4F0197F3C42E7
 locations:
   Campinas, SP:
     description: ''
diff --git a/users/mhocko.yaml b/users/mhocko.yaml
index 65d55d7..331b797 100644
--- a/users/mhocko.yaml
+++ b/users/mhocko.yaml
@@ -1,5 +1,5 @@
 email: mhocko@kernel.org
-key: B310E347
+key: 48E209A2B310E347
 locations:
   Default Place:
     description: 'Suse Linux s.r.o'
diff --git a/users/mmind.yaml b/users/mmind.yaml
index b64da86..cb44502 100644
--- a/users/mmind.yaml
+++ b/users/mmind.yaml
@@ -1,5 +1,5 @@
 email: heiko@sntech.de
-key: 9A5F5BBC
+key: 9AFB7B8C9A5F5BBC
 locations:
   'Dresden, Germany':
     description: >
diff --git a/users/morgan.yaml b/users/morgan.yaml
index 7cb1144..469b58d 100644
--- a/users/morgan.yaml
+++ b/users/morgan.yaml
@@ -1,5 +1,5 @@
 email: morgan@kernel.org
-key: E2CCF3F4
+key: 29EE848AE2CCF3F4
 locations:
   Default Place:
     description: ''
diff --git a/users/mpe.yaml b/users/mpe.yaml
index 00c5fe6..c124d85 100644
--- a/users/mpe.yaml
+++ b/users/mpe.yaml
@@ -1,6 +1,6 @@
 name: 'Michael Ellerman'
 email: 'mpe at ellerman.id.au'
-key: '2451 AD08 F0AD 8701 2FD9 8FDB 51EB EA3C C8E1 A580'
+key: '51EBEA3CC8E1A580'
 locations:
   'Canberra, ACT, Australia':
     description: 'powerpc maintainer'
diff --git a/users/mricon.yaml b/users/mricon.yaml
index 64fa3fd..00d3694 100644
--- a/users/mricon.yaml
+++ b/users/mricon.yaml
@@ -1,6 +1,6 @@
 name: 'Konstantin Ryabitsev'
 email: 'konstantin@linuxfoundation.org'
-key: '329DD07E'
+key: 'E63EDCA9329DD07E'
 locations:
     'Pointe-Claire, QC, Canada':
         latlong: '45.45,-73.80'
diff --git a/users/mtk.yaml b/users/mtk.yaml
index 1b31609..2238895 100644
--- a/users/mtk.yaml
+++ b/users/mtk.yaml
@@ -1,5 +1,5 @@
 email: mtk.manpages@gmail.com
-key: 3A35CE5E
+key: 856199113A35CE5E
 locations:
   Munich, DE:
     description: ''
diff --git a/users/mzx.yaml b/users/mzx.yaml
index 09016f8..ec7309b 100644
--- a/users/mzx.yaml
+++ b/users/mzx.yaml
@@ -1,5 +1,5 @@
 email: myungjoo.ham@samsung.com
-key: D606808A
+key: 13A1BABBD606808A
 locations:
   Jamsil, Seoul, KR:
     description: ''
diff --git a/users/namhyung.yaml b/users/namhyung.yaml
index ab92f07..1b81ebe 100644
--- a/users/namhyung.yaml
+++ b/users/namhyung.yaml
@@ -1,5 +1,5 @@
 email: namhyung@kernel.org
-key: 4E89E813
+key: 59FF77874E89E813
 locations:
   Dongtan, Korea:
     description: ''
diff --git a/users/narmstrong.yaml b/users/narmstrong.yaml
index f8e84eb..5aa871b 100644
--- a/users/narmstrong.yaml
+++ b/users/narmstrong.yaml
@@ -1,6 +1,6 @@
 name: 'Neil Armstrong'
 email: 'narmstrong@kernel.org'
-key: 'A4CFF8AE'
+key: '169AB7B1A4CFF8AE'
 locations:
     'Biot, France':
         latlong: '43.6280001,7.0966644'
diff --git a/users/neilb.yaml b/users/neilb.yaml
index 3878399..4b048aa 100644
--- a/users/neilb.yaml
+++ b/users/neilb.yaml
@@ -1,5 +1,5 @@
 email: neilb@suse.de
-key: 566281B9
+key: 39EC9EDD566281B9
 locations:
   Sydney, NSW 2035:
     description: ''
diff --git a/users/nmenon.yaml b/users/nmenon.yaml
index bf2c187..4b7cd7e 100644
--- a/users/nmenon.yaml
+++ b/users/nmenon.yaml
@@ -1,5 +1,5 @@
 email: nmenon@kernel.org
-key: 1736249D
+key: DDB5849D1736249D
 locations:
   Dallas, TX 75243:
     description: ''
diff --git a/users/nsaenz.yaml b/users/nsaenz.yaml
index 9db0f80..ea8ceee 100644
--- a/users/nsaenz.yaml
+++ b/users/nsaenz.yaml
@@ -1,6 +1,6 @@
 name: 'Nicolas Saenz Julienne'
 email: 'nsaenz@kernel.org'
-key: '7A3CC7FE'
+key: '95F6661E7A3CC7FE'
 locations:
     'Madrid':
         latlong: '40.40968,-3.703790'
diff --git a/users/nsekhar.yaml b/users/nsekhar.yaml
index 8b6f280..fd7218d 100644
--- a/users/nsekhar.yaml
+++ b/users/nsekhar.yaml
@@ -1,5 +1,5 @@
 email: nsekhar@ti.com
-key: EABE044D
+key: 6141BB68EABE044D
 locations:
   CV Raman Nagar, Bangalore:
     description: ''
diff --git a/users/ogabbay.yaml b/users/ogabbay.yaml
index 4477e39..db9518c 100644
--- a/users/ogabbay.yaml
+++ b/users/ogabbay.yaml
@@ -1,5 +1,5 @@
 email: ogabbay@kernel.org
-key: AB5AE780
+key: 651D4DB8AB5AE780
 locations:
   Ra'anana, Israel:
     description: ''
diff --git a/users/olof.yaml b/users/olof.yaml
index 91f300b..f3c9139 100644
--- a/users/olof.yaml
+++ b/users/olof.yaml
@@ -1,5 +1,5 @@
 email: olof@lixom.net
-key: DE841C77
+key: 8C1AE73CDE841C77
 locations:
   Belmont, CA 94002:
     description: ''
diff --git a/users/padovan.yaml b/users/padovan.yaml
index 713a439..a84a463 100644
--- a/users/padovan.yaml
+++ b/users/padovan.yaml
@@ -1,5 +1,5 @@
 email: gustavo@padovan.org
-key: F8B36D28
+key: FB373D45F8B36D28
 locations:
   Campinas, Brazil:
     description: ''
diff --git a/users/pateldipen1984.yaml b/users/pateldipen1984.yaml
index f80266d..154cbbf 100644
--- a/users/pateldipen1984.yaml
+++ b/users/pateldipen1984.yaml
@@ -1,5 +1,5 @@
 email: dipenpatel.kernel@gmail.com
-key: 4F60577C
+key: FBD4981A4F60577C
 locations:
   Fremont, CA USA:
     description: ''
diff --git a/users/paulg.yaml b/users/paulg.yaml
index 5273e8f..d28fa90 100644
--- a/users/paulg.yaml
+++ b/users/paulg.yaml
@@ -1,5 +1,5 @@
 email: paul.gortmaker@windriver.com
-key: 2C07D1D6
+key: EBCE84042C07D1D6
 locations:
   Kanata ON:
     description: ''
diff --git a/users/peterz.yaml b/users/peterz.yaml
index 7900a28..54b2246 100644
--- a/users/peterz.yaml
+++ b/users/peterz.yaml
@@ -1,5 +1,5 @@
 email: peterz@infradead.org
-key: 4BC0E4BA
+key: 7647E1A44BC0E4BA
 locations:
   Default Place:
     description: ''
diff --git a/users/pi3orama.yaml b/users/pi3orama.yaml
index b699838..04f45cf 100644
--- a/users/pi3orama.yaml
+++ b/users/pi3orama.yaml
@@ -1,6 +1,6 @@
 name: 'Wang Nan'
 email: 'wangnan0@huawei.com'
-key: '45D0B598'
+key: '58AFEE8045D0B598'
 
 locations:
   'Beijing':
diff --git a/users/pinchartl.yaml b/users/pinchartl.yaml
index 5c0c1aa..bcad839 100644
--- a/users/pinchartl.yaml
+++ b/users/pinchartl.yaml
@@ -1,6 +1,6 @@
 name: Laurent Pinchart
 email: laurent.pinchart@ideasonboard.com
-key: 6991256E
+key: F045C2B96991256E
 locations:
   'Helsinki, Finland':
     description: "My home town, happy to meet there with a few days' notice."
diff --git a/users/plagnioj.yaml b/users/plagnioj.yaml
index 8f0b8cf..48bd08d 100644
--- a/users/plagnioj.yaml
+++ b/users/plagnioj.yaml
@@ -1,5 +1,5 @@
 email: plagnioj@jcrosoft.com
-key: 593117F6
+key: EAE3C15E593117F6
 locations:
   Shanghai:
     description: ''
diff --git a/users/pmladek.yaml b/users/pmladek.yaml
index ddd784a..60b5d36 100644
--- a/users/pmladek.yaml
+++ b/users/pmladek.yaml
@@ -1,5 +1,5 @@
 email: pmladek@suse.com
-key: 488094F2
+key: 52A00C47488094F2
 locations:
   Prague, Czech Republic:
     description: ''
diff --git a/users/qmo.yaml b/users/qmo.yaml
index cd88e6b..579acda 100644
--- a/users/qmo.yaml
+++ b/users/qmo.yaml
@@ -1,6 +1,6 @@
 name: 'Quentin Monnet'
 email: 'qmo@kernel.org'
-key: '301C09B6'
+key: '057DE720301C09B6'
 locations:
     'Cambridge, United Kingdom':
         latlong: '52.2055314,0.1186637'
diff --git a/users/radim.yaml b/users/radim.yaml
index a26a191..d9efb13 100644
--- a/users/radim.yaml
+++ b/users/radim.yaml
@@ -1,6 +1,6 @@
 name: 'Radim Krčmář'
 email: 'radim@kernel.org'
-key: '2FA29DB8'
+key: '1B52E30D2FA29DB8'
 locations:
  'Brno':
   latlong: '49.2226846,16.5846348'
diff --git a/users/rafael.yaml b/users/rafael.yaml
index b7f4ef3..d59cb28 100644
--- a/users/rafael.yaml
+++ b/users/rafael.yaml
@@ -1,5 +1,5 @@
 email: rjw@rjwysocki.net
-key: 765E435D
+key: EF1F7EB8765E435D
 locations:
   Warsaw, Poland:
     description: ''
diff --git a/users/ralf.yaml b/users/ralf.yaml
index d336832..65262ad 100644
--- a/users/ralf.yaml
+++ b/users/ralf.yaml
@@ -1,5 +1,5 @@
 email: ralf@linux-mips.org
-key: 00B67682
+key: 2637F0CC00B67682
 locations:
   79837 St. Blasien, Germany:
     description: ''
diff --git a/users/raven.yaml b/users/raven.yaml
index 50b178b..5ac29c7 100644
--- a/users/raven.yaml
+++ b/users/raven.yaml
@@ -1,5 +1,5 @@
 email: raven@themaw.net
-key: F54FD8A9
+key: E7677380F54FD8A9
 locations:
   Kinross WA 6028, Australia:
     description: ''
diff --git a/users/realmz6.yaml b/users/realmz6.yaml
index 7240d3e..785e911 100644
--- a/users/realmz6.yaml
+++ b/users/realmz6.yaml
@@ -1,5 +1,5 @@
 email: realmz6@kernel.org
-key: CF8E49C7
+key: 9A2698CDCF8E49C7
 locations:
   Shanghai, China:
     description: ''
diff --git a/users/ribalda.yaml b/users/ribalda.yaml
index 2d82b83..5c48655 100644
--- a/users/ribalda.yaml
+++ b/users/ribalda.yaml
@@ -1,6 +1,6 @@
 name: 'Ricardo Ribalda'
 email: 'ribalda@kernel.org'
-key: '9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9'
+key: '56A0D81F9F782DA9'
 locations:
     'København':
         latlong: '55.6867243,12.5700724'
diff --git a/users/rkuo.yaml b/users/rkuo.yaml
index cb88734..2e521b5 100644
--- a/users/rkuo.yaml
+++ b/users/rkuo.yaml
@@ -1,5 +1,5 @@
 email: rkuo@codeaurora.org
-key: C19642DA
+key: 77035451C19642DA
 locations:
   Austin, TX:
     description: ''
diff --git a/users/robh.yaml b/users/robh.yaml
index 987e120..aed3f71 100644
--- a/users/robh.yaml
+++ b/users/robh.yaml
@@ -1,5 +1,5 @@
 email: robh@kernel.org
-key: 2382C5E2
+key: C86F629E2382C5E2
 locations:
   Austin, TX:
     description: ''
diff --git a/users/roland.yaml b/users/roland.yaml
index 12bdc11..f62948c 100644
--- a/users/roland.yaml
+++ b/users/roland.yaml
@@ -1,5 +1,5 @@
 email: roland@digitalvampire.org
-key: 6102DD21
+key: 435AE3866102DD21
 locations:
   Mountain View, CA 94041:
     description: ''
diff --git a/users/rostedt.yaml b/users/rostedt.yaml
index f8a6714..a238814 100644
--- a/users/rostedt.yaml
+++ b/users/rostedt.yaml
@@ -1,5 +1,5 @@
 email: rostedt@goodmis.org
-key: 5A56DE73
+key: EBC26CDB5A56DE73
 locations:
   Endwell, NY, USA:
     description: ''
diff --git a/users/rusty.yaml b/users/rusty.yaml
index dc492d1..2e3449b 100644
--- a/users/rusty.yaml
+++ b/users/rusty.yaml
@@ -1,5 +1,5 @@
 email: rusty@rustcorp.com.au
-key: D1ADB8F1
+key: D9200E6CD1ADB8F1
 locations:
   Adelaide, SA 5163:
     description: ''
diff --git a/users/rw.yaml b/users/rw.yaml
index 0eccfd8..f2a03ce 100644
--- a/users/rw.yaml
+++ b/users/rw.yaml
@@ -1,5 +1,5 @@
 email: richard@nod.at
-key: E0E1469A
+key: F99E2237E0E1469A
 locations:
   Default Place:
     description: ''
diff --git a/users/ryderlee.yaml b/users/ryderlee.yaml
index 4bd5478..82a4a8b 100644
--- a/users/ryderlee.yaml
+++ b/users/ryderlee.yaml
@@ -1,5 +1,5 @@
 email: ryder.lee@kernel.org
-key: EE369246
+key: 697322B3EE369246
 locations:
   Hsinchu, TW:
     description: 'I can sign your key in Hsinchu or Taipei'
diff --git a/users/sandeen.yaml b/users/sandeen.yaml
index a4160d7..6d4e81c 100644
--- a/users/sandeen.yaml
+++ b/users/sandeen.yaml
@@ -1,5 +1,5 @@
 email: sandeen@sandeen.net
-key: E13DDEE0
+key: 20AE1692E13DDEE0
 locations:
   Saint Paul, MN:
     description: ''
diff --git a/users/sashal.yaml b/users/sashal.yaml
index 3932788..db17339 100644
--- a/users/sashal.yaml
+++ b/users/sashal.yaml
@@ -1,5 +1,5 @@
 email: sashal@kernel.org
-key: 97772CDC
+key: DEA66FF797772CDC
 locations:
   Default Place:
     description: Southern NH, or Boston, MA
diff --git a/users/sboyd.yaml b/users/sboyd.yaml
index 49fe508..04e6ac5 100644
--- a/users/sboyd.yaml
+++ b/users/sboyd.yaml
@@ -1,5 +1,5 @@
 email: sboyd@codeaurora.org
-key: 2578E73D
+key: D89D81132578E73D
 locations:
   Mountain View, CA USA:
     description: ''
diff --git a/users/seanwang.yaml b/users/seanwang.yaml
index 3da5577..ecaef25 100644
--- a/users/seanwang.yaml
+++ b/users/seanwang.yaml
@@ -1,5 +1,5 @@
 email: sean.wang@kernel.org
-key: F475DF52
+key: 373DEC05F475DF52
 locations:
   Mountain View, CA USA:
     description: ''
diff --git a/users/shawnguo.yaml b/users/shawnguo.yaml
index dd25b3a..e00cc22 100644
--- a/users/shawnguo.yaml
+++ b/users/shawnguo.yaml
@@ -1,5 +1,5 @@
 email: shawnguo@kernel.org
-key: 87B07CCE
+key: 5057585A87B07CCE
 locations:
   Changshu, Jiangsu Province, China:
     description: ''
diff --git a/users/shli.yaml b/users/shli.yaml
index 320f80c..88bbc20 100644
--- a/users/shli.yaml
+++ b/users/shli.yaml
@@ -1,5 +1,5 @@
 email: shli@kernel.org
-key: 1FCF7DAD
+key: B4269A3D1FCF7DAD
 locations:
   Shanghai, China:
     description: ''
diff --git a/users/sj.yaml b/users/sj.yaml
index 541e047..c01fa7b 100644
--- a/users/sj.yaml
+++ b/users/sj.yaml
@@ -1,6 +1,6 @@
 name: 'SeongJae Park'
 email: 'sj@kernel.org'
-key: '4040912F'
+key: '8BC68E994040912F'
 locations:
     Seattle, WA:
         latlong: 47.6038321,-122.3300624
diff --git a/users/smb.yaml b/users/smb.yaml
index 5d8aa50..dccf451 100644
--- a/users/smb.yaml
+++ b/users/smb.yaml
@@ -1,5 +1,5 @@
 email: stefan.bader@canonical.com
-key: CBEECEA3
+key: E8675DEECBEECEA3
 locations:
   Rottenburg am Neckar, Germany:
     description: ''
diff --git a/users/sre.yaml b/users/sre.yaml
index 15c0ec9..f2fc96b 100644
--- a/users/sre.yaml
+++ b/users/sre.yaml
@@ -1,5 +1,5 @@
 email: sre@kernel.org
-key: C83BFA9A
+key: D8EED7F3C83BFA9A
 locations:
   Oldenburg, DE:
     description: ''
diff --git a/users/sumits.yaml b/users/sumits.yaml
index 1252fb9..81adbbe 100644
--- a/users/sumits.yaml
+++ b/users/sumits.yaml
@@ -1,5 +1,5 @@
 email: sumit.semwal@linaro.org
-key: AC2E7E5B
+key: 01BEFCD5AC2E7E5B
 locations:
   Bangalore 560008:
     description: Can key sign in Bangalore area.
diff --git a/users/swarren.yaml b/users/swarren.yaml
index efee212..5b42b4b 100644
--- a/users/swarren.yaml
+++ b/users/swarren.yaml
@@ -1,5 +1,5 @@
 email: swarren@nvidia.com
-key: 6D6F2731
+key: CCEB6A4E6D6F2731
 locations:
   Fort Collins, CO, USA:
     description: ''
diff --git a/users/timur.yaml b/users/timur.yaml
index 5d8b3dc..ee58acf 100644
--- a/users/timur.yaml
+++ b/users/timur.yaml
@@ -1,6 +1,6 @@
 name: Timur Tabi
 email: timur@kernel.org
-key: 9024E369
+key: C160046D9024E369
 locations:
   Austin, TX:
     description: 'Join me at Emerald Tavern for board games and key signings.'
diff --git a/users/tiwai.yaml b/users/tiwai.yaml
index 615db8d..fd83586 100644
--- a/users/tiwai.yaml
+++ b/users/tiwai.yaml
@@ -1,5 +1,5 @@
 email: tiwai@suse.de
-key: 3D2929A4
+key: 6C3180543D2929A4
 locations:
   Nuremberg, Germany:
     description: ''
diff --git a/users/tobin.yaml b/users/tobin.yaml
index 3cac79a..81c1409 100644
--- a/users/tobin.yaml
+++ b/users/tobin.yaml
@@ -1,5 +1,5 @@
 email: me@tobin.cc
-key: 661EC3B8
+key: 0312492D661EC3B8
 locations:
   Wadalba, NSW, Australia:
     latlong: -33.2733333,151.4677778
diff --git a/users/tyhicks.yaml b/users/tyhicks.yaml
index 6191cd8..3d25da0 100644
--- a/users/tyhicks.yaml
+++ b/users/tyhicks.yaml
@@ -1,5 +1,5 @@
 email: tyhicks@canonical.com
-key: AA02C70A
+key: D692003DAA02C70A
 locations:
   Dallas, TX:
     description: ''
diff --git a/users/tytso.yaml b/users/tytso.yaml
index 351f363..dcc53a8 100644
--- a/users/tytso.yaml
+++ b/users/tytso.yaml
@@ -1,5 +1,5 @@
 email: tytso@mit.edu
-key: C11804F0
+key: D36F769BC11804F0
 locations:
   Cambridge, MA:
     description: ''
diff --git a/users/tzungbi.yaml b/users/tzungbi.yaml
index 3d055b3..d5e5277 100644
--- a/users/tzungbi.yaml
+++ b/users/tzungbi.yaml
@@ -1,5 +1,5 @@
 email: tzungbi@kernel.org
-key: 30DDCBC6
+key: 82704BBB30DDCBC6
 locations:
   'Taipei 101':
     description: ''
diff --git a/users/vapier.yaml b/users/vapier.yaml
index 48abf86..61461bf 100644
--- a/users/vapier.yaml
+++ b/users/vapier.yaml
@@ -1,5 +1,5 @@
 email: vapier@gentoo.org
-key: E837F581
+key: 41633B9FE837F581
 locations:
   Default Place:
     description: ''
diff --git a/users/vgupta.yaml b/users/vgupta.yaml
index 86580f5..5f099e6 100644
--- a/users/vgupta.yaml
+++ b/users/vgupta.yaml
@@ -1,6 +1,6 @@
 name: Vineet Gupta
 email: vgupta@kernel.org
-key: E28AC25E
+key: 69D7F1DDE28AC25E
 locations:
   Fremont, California, USA:
     description: 'ARC architecture Maintainer'
diff --git a/users/vireshk.yaml b/users/vireshk.yaml
index 2b79eca..d8cc161 100644
--- a/users/vireshk.yaml
+++ b/users/vireshk.yaml
@@ -1,5 +1,5 @@
 email: viresh.kumar@linaro.org
-key: AE81121C
+key: D2B91C3CAE81121C
 locations:
   Bangalore:
     description: Bangalore 560037. Can key sign in Bangalore area.
diff --git a/users/vishal.yaml b/users/vishal.yaml
index 6aa2974..d180b17 100644
--- a/users/vishal.yaml
+++ b/users/vishal.yaml
@@ -1,5 +1,5 @@
 email: vishal@kernel.org
-key: A3B84DFF
+key: 7AFA61BEA3B84DFF
 locations:
   Boulder, CO:
     description: ''
diff --git a/users/vkoul.yaml b/users/vkoul.yaml
index 678b058..b30e777 100644
--- a/users/vkoul.yaml
+++ b/users/vkoul.yaml
@@ -1,5 +1,5 @@
 email: vkoul@kernel.org
-key: '25238347'
+key: '7C14070F25238347'
 locations:
   Bangalore:
     description: 'I can sign keys in Bangalore area. Can arrange for key-signing parties
diff --git a/users/wagi.yaml b/users/wagi.yaml
index 2e194b9..f3e9386 100644
--- a/users/wagi.yaml
+++ b/users/wagi.yaml
@@ -1,5 +1,5 @@
 email: wagi@monom.org
-key: 5D0A306C
+key: 587C5ECA5D0A306C
 locations:
   Munich, Germany:
     description: ''
diff --git a/users/wbg.yaml b/users/wbg.yaml
index e085525..fd3c2b7 100644
--- a/users/wbg.yaml
+++ b/users/wbg.yaml
@@ -1,6 +1,6 @@
 name: 'William Breathitt Gray'
 email: 'wbg@kernel.org'
-key: '8D37CDDDE0D22528F8E89FB6B54856CABE12232B'
+key: 'B54856CABE12232B'
 locations:
     'Orlando, FL':
         latlong: '28.5421109,-81.3790304'
diff --git a/users/wens.yaml b/users/wens.yaml
index 55c3fdd..fac9787 100644
--- a/users/wens.yaml
+++ b/users/wens.yaml
@@ -1,5 +1,5 @@
 email: wens@csie.org
-key: 1B4F2AEB
+key: C94035C21B4F2AEB
 locations:
   Taipei, TW:
     description: ''
diff --git a/users/will.yaml b/users/will.yaml
index 486aa6c..b728dfa 100644
--- a/users/will.yaml
+++ b/users/will.yaml
@@ -1,5 +1,5 @@
 email: will@kernel.org
-key: 3E542FD9
+key: 2DFBF4523E542FD9
 locations:
   Cambridge, UK:
     description: 'Find me in The Haymakers pub.'
diff --git a/users/wtarreau.yaml b/users/wtarreau.yaml
index fcf9160..1c05201 100644
--- a/users/wtarreau.yaml
+++ b/users/wtarreau.yaml
@@ -1,5 +1,5 @@
 email: w@1wt.eu
-key: 9C61702F
+key: 4E386D9C9C61702F
 locations:
   Default Place:
     description: ''
diff --git a/users/xiang.yaml b/users/xiang.yaml
index 63b9e04..cdc7b5a 100644
--- a/users/xiang.yaml
+++ b/users/xiang.yaml
@@ -1,5 +1,5 @@
 email: xiang@kernel.org
-key: 996EE6AA
+key: 517667E5996EE6AA
 locations:
   Hangzhou, Zhe Jiang, China:
     description: ''
diff --git a/users/yinghai.yaml b/users/yinghai.yaml
index cad6799..b8ddd48 100644
--- a/users/yinghai.yaml
+++ b/users/yinghai.yaml
@@ -1,5 +1,5 @@
 email: yinghai@kernel.org
-key: 39BD11DA
+key: A7C92F7A39BD11DA
 locations:
   Santa Clara, CA 95054:
     description: ''
diff --git a/users/zohar.yaml b/users/zohar.yaml
index bd1699b..eb88250 100644
--- a/users/zohar.yaml
+++ b/users/zohar.yaml
@@ -1,5 +1,5 @@
 email: zohar@us.ibm.com
-key: B03E715A
+key: 6B792466B03E715A
 locations:
   Hawthorne, NY:
     description: ''
diff --git a/yaml-to-kml.py b/yaml-to-kml.py
index 5b1f413..7de8101 100755
--- a/yaml-to-kml.py
+++ b/yaml-to-kml.py
@@ -109,7 +109,7 @@ if __name__ == '__main__':
 
                 if 'key' in ydata.keys():
                     desc += '''<br/>
-                    <b>Key stats:</b>&nbsp;<a href="http://pgp.cs.uu.nl/stats/%s.html">%s</a>
+                    <b>Key stats:</b>&nbsp;<a href="https://git.kernel.org/pub/scm/docs/kernel/pgpkeys.git/plain/graphs/%s.svg">%s</a>
                     ''' % (ydata['key'], ydata['key'])
                 desc += '</p><p class="devclear">'
 
-- 
2.43.0

