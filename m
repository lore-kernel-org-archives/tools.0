Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F74D9901
	for <tools@linux.kernel.org>; Fri,  4 Sep 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533996; cv=pass; b=ioYOrQ7CzMO9xuwIJLaGsP71Z02lX135u2F9RjrcbKJsb+5H4fcMdRXqyiHvtXvsRXYZponMkImfD7VghZzau5pHGpcaYCk4Bht25ppDCUJRSqi6EmcmJ2lPpHNbWPpR3DqXDvEviTrC3a+QggnTF0vmLJLFSsrmVA9jjB/3wts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533996; c=relaxed/simple;
	bh=FMv2iLT+bt9n8bWUb1VLCeupl0sRbCzCIg8IqRrt/3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCjjNtirraghUf1W5oRkd45tOlmO+s0KzK7FpA2RAESQ7Sd8JxYdWTuJY+ejYKNvX+zuXCEnn6lUjXPdauZbI7rCxDK7x4aSQxQwC9cg0gJTJtOyQZdfyGvfpsZJBe98esjfHq3Dja04Al2y6fqTpTGXt7yefER+hOsOVU+Yc/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=LG/t864E; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="LG/t864E"
Received: by smtp.kernel.org (Postfix)
	id AA66A1F00A3F; Fri,  4 Sep 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=130.117.225.111
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788533993;
	b=SD2nK/DdlA+9mhTWIEycfW6j/DzDMhe7Qo30syEvXllOLQyrk+JwCMslUT/+9XHjaoD4
	 JQSBfLRceBPXfoce9vyuOBOo54HNljGP3rKY/XoiuIqdb1sl7JVTO/ZOYGwAHD3Xg72Zp
	 D71cnh9T6Ppw/lxm3ML+vsaUEjgsdAzUeFOUEuA4GUWxmRlrBM1no46/C+LcHgsnWsoxO
	 ZVMpWU+aBea8rghIBf3+VIIpUK/CLgfl3WuweGEBHHQbtLRz2QrxdYwYO4dFdwCKS1CDj
	 Vw/nXnRx61KaV6YN6gbi4ViTvygQjC8wgsVAHZjAZ2NOd231yOqqYIIe9eBO61cZ0Vg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788533993;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=iFLBFfp4hIKTK993XjlTWyU4CD96uPAyItIuCg4c4tg=;
	b=MdCCjZ5O39Rby3acThS1bWkOzQSPLKFEC+ZsP1WQYc2MD0RLcVDv6hw/H5iVHHTNSrEz
	 abWHCDy/IZagOVioQCvbg6Ndg3iFHXZNmVbu+tgT1WE9nFUYANN8VaHsq4zdFX4vmhOdE
	 f3rwreGZ6V4UAc7jweHdkbZ+KgbgWWf6CPeJWR+Ee43/aA+9lZr74++uGM78b4bz+kH7W
	 kF6gCnZxJ8ytjhQJZM7dgcCExxGybIPdUHY2LpiZB2OU4wHJdYCICuensdsTUPy5BRU5X
	 ZHg0s038T9FwzXrdT/L4Ypq2Kowci0ZcsTGTxrH6fRi5luyKw4rEdAvjIkhL0dPFwSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b="LG/t864E";
	dmarc=pass header.from=virtuozzo.com;
	spf=pass smtp.mailfrom=virtuozzo.com;
	arc=none smtp.remote-ip=130.117.225.111
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BD881F00A3E
	for <tools@kernel.org>; Fri,  4 Sep 2026 14:59:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=virtuozzo.com header.i=@virtuozzo.com header.a=rsa-sha256 header.s=relay header.b=LG/t864E
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1BD881F00A3E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=iFLBFfp4hIKTK993XjlTWyU4CD96uPAyItIuCg4c4tg=; b=LG/t864Eye/b
	Ozuri64IIcLWr5dmdiqcVD+M9En2fR4f2s3ol+Il/n45ndkJCPg7VSFDMWN0hkkwaJQtv66m7TxOV
	vjP6Bqj6vWy2dlJ2PHfyO8PdConrvtD6ymYQ0mHnP2sj3ALloOt+tcuFzUnx16bf8l9URaDhk7guW
	p5P0J7jH5FsqFbro/eyZ+J08Se8v46UxiFqEzrXjNoPMu1CL4pobxQqn9pyL70JZw/8Cb/IeNW6xY
	59jHHLEfr1q30RjrT4jXUyoge9SK3EoTyZYE3KQqVk1evknIWC3nPvKzZmVt75pts6Q7dCpzPygYi
	JcQ4HUesSGIPL7rJB6Z1LQ==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1x2VLz-006gpa-0e;
	Fri, 04 Sep 2026 16:59:47 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: tools@kernel.org
Cc: Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH b4 1/2] tui: fix MissingStyle crash under Textual ansi themes
Date: Fri,  4 Sep 2026 16:59:50 +0200
Message-ID: <20260904145951.1414701-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolving styles under an ansi theme (TEXTUAL_THEME=ansi-light/dark,
or one picked from the command palette) crashes:

  MissingStyle: 'transparent' is not a valid color

Textual's ansi themes resolve $panel/$surface to the CSS keyword
"transparent" and can suffix a colour with an alpha percentage; Rich
accepts neither. Reduce both to the terminal default colour in
_to_rich_color(), which fixes every consumer of resolve_styles().

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Assisted-by: claude-sonnet-5
---
 src/b4/tui/_common.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/src/b4/tui/_common.py b/src/b4/tui/_common.py
index 844d980..a378dd3 100644
--- a/src/b4/tui/_common.py
+++ b/src/b4/tui/_common.py
@@ -278,9 +278,20 @@ def matches_limit(
     variable system.  Rich expects ``green``, ``bright_blue``, etc.
     Non-ansi values (hex codes, named CSS colours) pass through unchanged.
     ``ansi_default`` maps to ``default``.
+
+    Textual's ansi themes resolve ``$panel``/``$surface`` to the CSS
+    keyword ``transparent`` and can append an alpha percentage
+    (``default 50%``). Rich understands neither, and feeding one into a
+    style string raises ``MissingStyle``, so both are reduced to the
+    terminal default colour.
     """
+    parts = textual_color.rsplit(' ', 1)
+    if len(parts) == 2 and parts[1].endswith('%'):
+        textual_color = parts[0]  # drop the alpha suffix
     if textual_color.startswith('ansi_'):
         return textual_color[5:]  # strip 'ansi_' prefix
+    if textual_color == 'transparent':
+        return 'default'
     return textual_color
 
 
-- 
2.43.0

