Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC138A71E
	for <tools@linux.kernel.org>; Tue, 28 Apr 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368570; cv=none; b=qMCMoSBZbsAk/gBOFizE79mZ3vJp1+8rey3QjOfwNwIdICECQRWfwTkWOA/3+PL4Xez4iT+LmvLfaKhTqLI8pK2X6hoQF/cupyXTSw8EjVUyLo/PySBmSzfs5LGPiXYenphKG7Ct9AmruKigexz5ACuXSscI38s8lBEYPWQ15tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368570; c=relaxed/simple;
	bh=J6e8Cr54KJNymnRI4ZoQHeKnMTTW9V+tPZ514LRmepA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/KALuBOHWWNniPtxwuEs9/ek6LrtL9/64vAmNJ/jRcYW6sWHAkJKkQEN+Haj9VrN9DFhKKdTZVw3lOBe+j01dnZZRB1V8OZe+hI3WVQbdKh00/Fker7Id31HsJl3TKhop1wiCo3fyGNVf1ZllYv4sLv9TBo6nd3f1lAyqZ/YVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zy7vW1HY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zy7vW1HY"
Received: by smtp.kernel.org (Postfix)
	id F1A93C2BCB5; Tue, 28 Apr 2026 09:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548E6C2BCC6;
	Tue, 28 Apr 2026 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777368569;
	bh=J6e8Cr54KJNymnRI4ZoQHeKnMTTW9V+tPZ514LRmepA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zy7vW1HYeR2gNdLP1/WMVNoRhOEG1d5dUcxRfSwzx+p/G8durJOUe5yy/wPZcw6sc
	 q+reKoTMN+9OYna/MaZyeTd624IH+UjwRyA56y1tRDNk6b/X6MLCkNiCrL28QB/2xG
	 bBd9Ugi7L5ZOBmqxAAnFIy5jKn2X1gRROihdf0IVyUdoL/Zt2QaUlE20932ODYcdTQ
	 F8BkBLi1JDeIbXO/exoq7AGQTq/RAjXaIidv29Xz2gMEFaCrFsrNqQ9iW4rTmMK0ON
	 2brZ3c7G2mEC0FOetZlNXJUUs2tIbbbm/LC3KvwU1MLgF0xvrsRkl3Bgu9MM3/4baF
	 6J1zDKXZwADew==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Tue, 28 Apr 2026 11:29:14 +0200
Subject: [PATCH b4 1/3] review: sashiko: switch to patchset endpoint
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-sashiko-patchset-api-v1-1-24d4ac34b4ae@kernel.org>
References: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
In-Reply-To: <20260428-sashiko-patchset-api-v1-0-24d4ac34b4ae@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=J6e8Cr54KJNymnRI4ZoQHeKnMTTW9V+tPZ514LRmepA=;
 b=owGbwMvMwCVWo/Th0Gd3rumMp9WSGDI/1H47sOp0fkn+ur3u/ct3frdZclZSUDLy7It1r/d51
 S4+unsfQ0cpC4MYF4OsmCKLdFtk/sznVbwlXn4WMHNYmUCGMHBxCsBEHkUyMjyZ0NtjtqdLe8v/
 iDUKk29t0Zy9w0Jzy4rqZzyGE1fvPdvC8E9XhTuj+9Au9fsXA3US+ZqKnK+LbY9KECxWCnC2bz8
 9mwUA
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

The 'patch' endpoint also contains the logs [1], which can be huge -- up
to a few MBytes -- and not used here.

That's why a new 'patchset' endpoint has been introduced with the same
content, but without the logs that can be retrieved from 'review_log' if
needed [2].

Link: https://github.com/sashiko-dev/sashiko/issues/57 [1]
Link: https://github.com/sashiko-dev/sashiko/commit/3dbb448ed0a4 [2]
Assisted-by: My-slow-DSL-connection
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
 src/b4/review/checks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/b4/review/checks.py b/src/b4/review/checks.py
index 36c0780..2ff825f 100644
--- a/src/b4/review/checks.py
+++ b/src/b4/review/checks.py
@@ -361,7 +361,7 @@ def _fetch_sashiko_patchset(msgid: str, sashiko_url: str) -> Optional[Dict[str,
     if msgid in _sashiko_patchset_cache:
         return _sashiko_patchset_cache[msgid]
 
-    url = f'{sashiko_url.rstrip("/")}/api/patch'
+    url = f'{sashiko_url.rstrip("/")}/api/patchset'
     try:
         session = b4.get_requests_session()
         resp = session.get(url, params={'id': msgid}, timeout=30)

-- 
2.53.0

