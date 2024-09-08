Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CE175562
	for <tools@linux.kernel.org>; Sun,  8 Sep 2024 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827032; cv=none; b=FNI5zKejWTxSwBXkH/9A73+9vL1Eg1446jtJ7wFbKBGwtld0BOSmAG12/tZ/Pbxym+VDUzhT65HnV10ZGfyv3vMyuSFKepBwWaWrnWhMjdcuG4lMYcBKmS9Htob9hOeVraF7W7SP28arqtVN/z66BRfLRWwuEHNU+0tmb3c1oLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827032; c=relaxed/simple;
	bh=Bj0TOF73Obt2VgP+yz2pspxMDs8IBX1yXfv1zN+7b7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbwY+mTkvXF4q7UlQtDcrYtr19UZ4cO9Uuj5736A9j4t8Ey+VZ/6CFGJLOMqe6KVK0v2Z2WOhsbaRqhUMR9CD9OhcKCUnKUCBuGNGStmfZyOLGZLhYMTAUXjWoiAgyTvf8SZlnqyNeNSAMfWz2cUdukD3SHrukC6wtGl3L6GAYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b=m2j3pMIt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=heusel.eu header.i=christian@heusel.eu header.b="m2j3pMIt"
Received: by smtp.kernel.org (Postfix)
	id 498C3C4CEC6; Sun,  8 Sep 2024 20:23:52 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BA9ECC4CEC3
	for <tools@kernel.org>; Sun,  8 Sep 2024 20:23:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BA9ECC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heusel.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heusel.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=heusel.eu;
	s=s1-ionos; t=1725827026; x=1726431826; i=christian@heusel.eu;
	bh=0ALNX2x3IDOQi32LYp+l9+WtWLDVuM3NQu+ZUL//Chg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=m2j3pMItMOCuUPLILQTmdZ4+wLg8xvuOQatxwWGeXialAIWPhfgmMCKsGheKnJnY
	 MfLfPaMe1F+cvOaaTN+e0eS5X+KmVds2vbDLi89o4OapSkWNcySgYu0HebGQ0BVr8
	 v9JiBgxDBsJc+HO2Z/OlU/W02uVMcgF0043l02SBLa1rC5Wup1xyFyi9jv3WQGbyM
	 blXH7miK6nqorIQbtlavponSh+JmASGwpUCm4DOIRVtXu14V97QS/zU06XcNmsbf2
	 F0OoayTKDVEu5FBGgOrkdztLv8ZQHd7XQlMaecrPDiPZq2nKuZNXk4L67fRyBr/DA
	 gO7ijRSLsG+P82hRvQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from meterpeter.fritz.box ([93.196.147.242]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M8hlZ-1sjHhz0atl-007G3V; Sun, 08 Sep 2024 22:23:46 +0200
From: Christian Heusel <christian@heusel.eu>
To: tools@kernel.org
Cc: Christian Heusel <christian@heusel.eu>
Subject: [PATCH] change the manpage section from 5 to 1
Date: Sun,  8 Sep 2024 22:23:31 +0200
Message-ID: <20240908202331.386220-1-christian@heusel.eu>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:neeIevUZDMldcCau7XYJYv6Cxu7WJmUXVzokZcT9Cg+0iKtJFfW
 wwP6hpHWfUEa5+bQrS0WYYnsztJg+KLjEZ8jZetNsv+XGiJWy0y6Et+cUfPup6KXK/DxTp3
 AAVAnbxy9m0g53wbqw6Dnq4DhaekguU7MFH9mzmhuwPb5JsUKEYa8+Qt3TzttroFsMwBGBL
 jOp9VwMU5Vcn9UsfIy+jw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:45tensx8tNs=;art2TXLJxO6InkBcZyfkMK71b3W
 U1egEEBFHPpmTAlXVAzdq195iEMiFcI9Q7dzYJI1IPaf00535I0eohKSbbefHATctSpK6+Td/
 MjyvxqX/6dGBKn76o/at7+yFR6jWuUkIS1XeBYJA65Y/0B/BkGIq/Mvxvzhm6sJvppPUTsp4f
 lz3jAMvGW8XqGt9ab7Nelrzh1aqfzCrvFxBTmlux3P6SRfx8Po4KQMnf7Wx9AtGTe4BWDCt/0
 yb44GKCHN0Iiksv1dnGYhoh2DoaV/8nmOcKPUAEPbtZ3WZ1JNheZbBYcpqiPdYhHy4M6cKlRM
 ggibMzDzlZm4h1ihHkxkLMX3WTkYB0xiNaTLSH339dcIibnMMZidgKjzcdQ0Gt8oSVRuboIqc
 i1JPAgPJzK7D3sl8pYDjjqz1HhP7Z1Wwf2xmmZUCI6A1TvoRIw4tzUMYSsc3sGn0AdreZc8BJ
 GXeeZg0LTDI9uTkI4lRib7c3UIsY99x7shtL3/DBjyJ2Nq+K5lpKwGOsQas3BgjdyPfJ+3k+m
 g0of3M8ItJDDCLHUihdZYFnn+QLhqoHuhLr+CEIXfxAyxBtQYaiDdGgtwOGr5OO20pGCpvHIH
 B17vbWbXi6mLAOf+pQOeix1kTXjNnkkgBceNSmD0wELioqwl6hAGk+EMhfb7mAP48cp9LERS5
 knjfFd7ct9aHLq6xq88YVHuRFMJnpZy5oHeb4xkV6xvgItfDDPEJ+Xt+BmQ3FjUUQ+Yt6TBB1
 crFD3JTAyAR/fcwDbSXO+aTvmdm6csanw==

Manpages in category 5 are according to 'man man' docs for "File formats
and conventions, e.g. /etc/passwd", which does not fit the contents of
the manpage in question. Instead move it to section 1, which contains
docs for "Executable programs or shell commands".

Since this also requires a small code change in the docs themselves also
regenerate the rendered version of the manpage.

Signed-off-by: Christian Heusel <christian@heusel.eu>
=2D--
 src/b4/man/{b4.5 =3D> b4.1}         | 14 +++++++-------
 src/b4/man/{b4.5.rst =3D> b4.1.rst} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename src/b4/man/{b4.5 =3D> b4.1} (96%)
 rename src/b4/man/{b4.5.rst =3D> b4.1.rst} (99%)

diff --git a/src/b4/man/b4.5 b/src/b4/man/b4.1
similarity index 96%
rename from src/b4/man/b4.5
rename to src/b4/man/b4.1
index e0da493..5aa4a3c 100644
=2D-- a/src/b4/man/b4.5
+++ b/src/b4/man/b4.1
@@ -27,7 +27,7 @@ level margin: \\n[rst2man-indent\\n[rst2man-indent-level=
]]
 .\" new: \\n[rst2man-indent\\n[rst2man-indent-level]]
 .in \\n[rst2man-indent\\n[rst2man-indent-level]]u
 ..
-.TH "B4" 5 "2024-06-10" "0.14-dev"
+.TH "B4" "1" "2024-06-10" "0.14-dev"
 .SH NAME
 B4 \- Work with code submissions in a public-inbox archive
 .SH SYNOPSIS
@@ -43,7 +43,7 @@ like those used in the Linux kernel development.
 The name \(dqb4\(dq was chosen for ease of typing and because B\-4 was th=
e
 precursor to Lore and Data in the Star Trek universe.
 .sp
-Full documentation is available on \fI\%https://b4.docs.kernel.org/\fP\&.
+Full documentation is available on  <https://b4.docs.kernel.org/> \&.
 .SH SUBCOMMANDS
 .sp
 Maintainer\-oriented:
@@ -285,7 +285,7 @@ These commands allow preparing and submitting a patch =
series for review
 on the mailing list. Full documentation is available online at the
 following address:
 .sp
-\fI\%https://b4.docs.kernel.org/en/latest/contributor/overview.html\fP
+ <https://b4.docs.kernel.org/en/latest/contributor/overview.html>
 .sp
 For options, see the output of \fBb4 prep \-\-help\fP, \fBb4 trailers
 \-\-help\fP and \fBb4 send \-\-help\fP\&.
@@ -330,16 +330,16 @@ either the toplevel \fB$HOME/.gitconfig\fP file, or =
in a per\-repository
 \&.git/config file if your workflow changes per project.
 .sp
 To see configuration options available, see online documentation at
-\fI\%https://b4.docs.kernel.org/en/latest/config.html\fP
+ <https://b4.docs.kernel.org/en/latest/config.html>
 .SH PROXYING REQUESTS
 .sp
 Commands making remote HTTP requests may be configured to use a proxy by
 setting the \fBHTTPS_PROXY\fP environment variable, as described in
-\fI\%https://docs.python\-requests.org/en/latest/user/advanced/#proxies\f=
P\&.
+ <https://docs.python\-requests.org/en/latest/user/advanced/#proxies> \&.
 .SH SUPPORT
 .sp
-Please email \fI\%tools@kernel.org\fP with support requests, or browse th=
e list
-archive at \fI\%https://lore.kernel.org/tools\fP\&.
+Please email  <tools@kernel.org>  with support requests, or browse the li=
st
+archive at  <https://lore.kernel.org/tools> \&.
 .SH AUTHOR
 mricon@kernel.org

diff --git a/src/b4/man/b4.5.rst b/src/b4/man/b4.1.rst
similarity index 99%
rename from src/b4/man/b4.5.rst
rename to src/b4/man/b4.1.rst
index bd136f4..5adae9e 100644
=2D-- a/src/b4/man/b4.5.rst
+++ b/src/b4/man/b4.1.rst
@@ -9,7 +9,7 @@ Work with code submissions in a public-inbox archive
 :Copyright: The Linux Foundation and contributors
 :License:   GPLv2+
 :Version:   0.14-dev
-:Manual section: 5
+:Manual section: 1

 SYNOPSIS
 --------
=2D-
2.46.0

