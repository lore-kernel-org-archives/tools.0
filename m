Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DDA70
	for <tools@linux.kernel.org>; Fri, 23 Apr 2021 07:13:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 053FC61042;
	Fri, 23 Apr 2021 07:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619162006;
	bh=PAqIJZ2rpBHBIyvWHunC2WlZ8i+kIO7pR6NQX/2HVn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KjU8jdN1++i+O6Fl0OrLmtgR6Z7kp9JTCBZkcNzMdJSMhrZu+R4Yu1+pXyuUPWINZ
	 FHRcdTq0kgyXnK22vt/3NRbTRr39uiGpKj+tp/E9PlakT4XcFdS9RTXWMpj6E987wc
	 p+USnsil/3qFgJ0w8FP5I6MJ3BzflsEJl8JgLzjijVNiwI8J+tuqFnI3nC1Dhk9FSN
	 2C1hKVGW9KAWeGd8qnKxwdCtrogewk8fN+7YrYejDuQtqNxwbvLYJQv2dBWJJq+ABe
	 iTw6lti3orTJXMgdpzFLOVKkx2Y7k0aPs9s/0vakhY8+XiDkUqgFCcz7XD+JA0ha3C
	 enmym22zL2F/w==
Date: Fri, 23 Apr 2021 09:13:20 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Rob Herring  <robherring2@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Leon Romanovsky <leon@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev,
 tools@linux.kernel.org
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210423091320.4f2381b2@coco.lan>
In-Reply-To: <6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
	<20210422112001.22c64fe9@coco.lan>
	<YIFfXTVMDmHwVmSR@unreal>
	<20210422092916.556e5e50@gandalf.local.home>
	<CAL_JsqKS-=shqkLhzKeLHqNPhosGJw5X-fOi+dy1rT3Q_LfBZg@mail.gmail.com>
	<20210423080454.78f4f662@coco.lan>
	<6c221d801c5a6834168207b5ccadc76ac432c766.camel@perches.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 22 Apr 2021 23:46:31 -0700
Joe Perches <joe@perches.com> escreveu:

> On Fri, 2021-04-23 at 08:04 +0200, Mauro Carvalho Chehab wrote:
> > I have a script to automate it, but I had to tweak it while handling
> > patches that cross a single subsystem boundaries, using git send-email
> > with the c/c list obtained from get_maintainers.pl.
> >=20
> > By default, the script adds all maintainers, reviewers and all mailing
> > lists to the cover letter, but that sometimes generate a cover letter
> > with 80+ c/c, which will be automatically rejected by anti-spam
> > measures and by mail servers.
> >=20
> > So, I played with two different alternatives:
> >=20
> > 1. At the beginning, I changed the script to c/c only the mailing lists,
> > =C2=A0=C2=A0=C2=A0excluding maintainers/reviewers;
> > 2. As the feedback was not great, I changed the script to c/c only
> > =C2=A0=C2=A0=C2=A0the maintainers, excluding mailing lists/reviewers. I=
t seems that
> > =C2=A0=C2=A0=C2=A0this worked better.
> >=20
> > I didn't try to play with bcc, as replying to it would not send
> > the replies to everyone.
> >=20
> > If you think it is worth, I could submit it to scripts/, but I
> > suspect we may need to adjust it to work with all maintainers'
> > workflows. =20
>=20
> I have a very similar script
>=20
> A portion of a cc script I use tests whether cc'ing the cover letter
> to all listed maintainers of a patch series creates a header of less
> than 512 chars and if so cc's all relevant maintainers, otherwise it
> just cc's the mailing lists.
>=20
> (Ingo didn't/doesn't want to receive any emails from me)
>=20
> $ cat ~/bin/remove_undesirable_emails.sh
> grep -vPi "(?:\bIngo\s+Molnar\b)"
>=20
> $ cat ~/bin/cc.sh
> #!/bin/bash
>=20
> opts=3D"--nogit --nogit-fallback --norolestats"
> maint_file=3D$(mktemp -t XXXXXXXX.cc)
>=20
> if [[ $(basename $1) =3D~ ^0000- ]] ; then
>     ./scripts/get_maintainer.pl $opts $(dirname $1)/* |  \
> 	~/bin/remove_undesirable_emails.sh > $maint_file
>     count=3D$(wc -c $maint_file | cut -f1 -d" ")
>     if [[ $count -lt 512 ]] ; then
> 	cat $maint_file
>     else
> 	./scripts/get_maintainer.pl -nom -nor $opts $(dirname $1)/* | \
> 	    ~/bin/remove_undesirable_emails.sh
>     fi
>=20
> ...
>=20

Heh, mine is a lot more complex than that ;-)=20

It internally runs git format-patch, git send-email and get_maintainers.pl,
and, when --cover or --annotate is used, it opens a window to allow
editing the text. It has several options in order to tweak its behavior.=20

That's the result of trying to send a patch series (in this example,
 16 patches for staging/media drivers):

<snip>
$ send-patches.pl upstream/master.. --cover
$ git format-patch -o patches/tmp --stat --summary --patience --signoff --t=
hread=3Dshallow --cover-letter --subject-prefix 'PATCH' upstream/master..
Checking patches/tmp/0000-cover-letter.patch
Checking patches/tmp/0001-media-staging-media-hantro-Align-line-break-to-th=
e-o.patch
./scripts/get_maintainer.pl  patches/tmp/0001-media-staging-media-hantro-Al=
ign-line-break-to-the-o.patch
    Cc + cover Cc: Ezequiel Garcia <ezequiel@collabora.com> (maintainer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc + cover Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer)
    Cc + cover Cc: Philipp Zabel <p.zabel@pengutronix.de> (maintainer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
    Cc + cover Cc: linux-rockchip@lists.infradead.org (open list)
Checking patches/tmp/0002-media-staging-media-hantro-Align-line-break-to-th=
e-o.patch
./scripts/get_maintainer.pl  patches/tmp/0002-media-staging-media-hantro-Al=
ign-line-break-to-the-o.patch
    Cc + cover Cc: Ezequiel Garcia <ezequiel@collabora.com> (maintainer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc + cover Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer)
    Cc + cover Cc: Philipp Zabel <p.zabel@pengutronix.de> (maintainer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
    Cc + cover Cc: linux-rockchip@lists.infradead.org (open list)
Checking patches/tmp/0003-media-staging-media-omap4iss-Align-line-break-to-=
the.patch
./scripts/get_maintainer.pl  patches/tmp/0003-media-staging-media-omap4iss-=
Align-line-break-to-the.patch
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc + cover Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (ma=
intainer)
    Cc + cover Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0004-media-staging-media-atomisp-Removed-a-superfluous=
-el.patch
./scripts/get_maintainer.pl  patches/tmp/0004-media-staging-media-atomisp-R=
emoved-a-superfluous-el.patch
    Cc: Filip Kolev <fil.kolev@gmail.com> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Martiros Shakhzadyan <vrzh@vrzh.net> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc + cover Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0005-media-staging-media-atomisp-i2c-align-line-break-=
to-.patch
./scripts/get_maintainer.pl  patches/tmp/0005-media-staging-media-atomisp-i=
2c-align-line-break-to-.patch
    Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com> (c=
ommit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0006-media-staging-media-intel-ipu3-remove-unnecessary=
-bl.patch
./scripts/get_maintainer.pl  patches/tmp/0006-media-staging-media-intel-ipu=
3-remove-unnecessary-bl.patch
    Cc + cover Cc: Bingbu Cao <bingbu.cao@intel.com> (reviewer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Mitali Borkar <mitaliborkar810@gmail.com> (commit_signer)
    Cc: Rahul Gottipati <rahul.blr97@gmail.com> (cc)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: Tianshu Qiu <tian.shu.qiu@intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0007-media-staging-media-intel-ipu3-reduce-length-of-l=
ine.patch
./scripts/get_maintainer.pl  patches/tmp/0007-media-staging-media-intel-ipu=
3-reduce-length-of-line.patch
    Cc + cover Cc: Bingbu Cao <bingbu.cao@intel.com> (reviewer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Mitali Borkar <mitaliborkar810@gmail.com> (commit_signer)
    Cc: Rahul Gottipati <rahul.blr97@gmail.com> (cc)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: Tianshu Qiu <tian.shu.qiu@intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0008-media-staging-media-intel-ipu3-remove-space-befor=
e-t.patch
./scripts/get_maintainer.pl  patches/tmp/0008-media-staging-media-intel-ipu=
3-remove-space-before-t.patch
    Cc + cover Cc: Bingbu Cao <bingbu.cao@intel.com> (reviewer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Mitali Borkar <mitaliborkar810@gmail.com> (commit_signer)
    Cc: Rahul Gottipati <rahul.blr97@gmail.com> (cc)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: Tianshu Qiu <tian.shu.qiu@intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0009-media-staging-media-intel-ipu3-line-should-not-en=
d-w.patch
./scripts/get_maintainer.pl  patches/tmp/0009-media-staging-media-intel-ipu=
3-line-should-not-end-w.patch
    Cc + cover Cc: Bingbu Cao <bingbu.cao@intel.com> (reviewer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (cc)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Mitali Borkar <mitaliborkar810@gmail.com> (commit_signer)
    Cc: Rahul Gottipati <rahul.blr97@gmail.com> (commit_signer)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: Tianshu Qiu <tian.shu.qiu@intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0010-media-staging-media-zoran-add-spaces-around-opera=
tor.patch
./scripts/get_maintainer.pl  patches/tmp/0010-media-staging-media-zoran-add=
-spaces-around-operator.patch
    Cc + cover Cc: Corentin Labbe <clabbe@baylibre.com> (maintainer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc + cover Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
    Cc + cover Cc: mjpeg-users@lists.sourceforge.net (open list)
Checking patches/tmp/0011-media-staging-media-atomisp-Minor-code-style-chan=
ges.patch
./scripts/get_maintainer.pl  patches/tmp/0011-media-staging-media-atomisp-M=
inor-code-style-changes.patch
    Cc: Filip Kolev <fil.kolev@gmail.com> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Martiros Shakhzadyan <vrzh@vrzh.net> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc + cover Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0012-media-staging-media-omap4iss-Remove-unused-macro-=
fun.patch
./scripts/get_maintainer.pl  patches/tmp/0012-media-staging-media-omap4iss-=
Remove-unused-macro-fun.patch
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc + cover Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com> (ma=
intainer)
    Cc + cover Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (maintainer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0013-media-staging-media-atomisp-pci-Correct-identatio=
n-i.patch
./scripts/get_maintainer.pl  patches/tmp/0013-media-staging-media-atomisp-p=
ci-Correct-identation-i.patch
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc + cover Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0014-media-staging-media-atomisp-pci-Correct-identatio=
n-i.patch
./scripts/get_maintainer.pl  patches/tmp/0014-media-staging-media-atomisp-p=
ci-Correct-identation-i.patch
    Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com> (commit_sig=
ner)
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0015-media-staging-media-atomisp-pci-Format-comments-a=
cco.patch
./scripts/get_maintainer.pl  patches/tmp/0015-media-staging-media-atomisp-p=
ci-Format-comments-acco.patch
    Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com> (commit_sig=
ner)
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (commit_signer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
Checking patches/tmp/0016-media-staging-media-atomisp-pci-Format-comments-a=
cco.patch
./scripts/get_maintainer.pl  patches/tmp/0016-media-staging-media-atomisp-p=
ci-Format-comments-acco.patch
    Cc: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com> (commit_sig=
ner)
    Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (commit_signer)
    Cc: Arnd Bergmann <arnd@arndb.de> (commit_signer)
    Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org> (cc)
    Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl> (commit_signer)
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org> (commit_signer)
    Cc + cover Cc: Sakari Ailus <sakari.ailus@linux.intel.com> (reviewer)
    Cc + cover Cc: devel@driverdev.osuosl.org (open list)
    Cc + cover Cc: linux-kernel@vger.kernel.org (open list)
    Cc + cover Cc: linux-media@vger.kernel.org (open list)
patches/tmp/0000-cover-letter.patch:
    Cc: Bingbu Cao <bingbu.cao@intel.com>
    Cc: Corentin Labbe <clabbe@baylibre.com>
    Cc: Ezequiel Garcia <ezequiel@collabora.com>
    Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
    Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
    Cc: Philipp Zabel <p.zabel@pengutronix.de>
    Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
    Cc: Tianshu Qiu <tian.shu.qiu@intel.com>
    Cc: devel@driverdev.osuosl.org
    Cc: linux-kernel@vger.kernel.org
    Cc: linux-media@vger.kernel.org
    Cc: linux-rockchip@lists.infradead.org
    Cc: mjpeg-users@lists.sourceforge.net
Number of Cc at cover: 13
</snip>

I guess I'll post it as a RFC patch c/c this thread.

Thanks,
Mauro
