Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E801F03F0
	for <tools@linux.kernel.org>; Tue, 17 Dec 2024 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734451908; cv=none; b=XzEsIYDZcDMldCQIOjA/gFNussp7nsrblp69dVW/wupBSq8juSQiNM1mbatnLyHrzJmwStNjTCm8p5rwF9dESKVSrT3EsuKCLG69YtTBzh0bXAaAsm1BVt571OIArpPB24er0EYT7f9FZeT3fYAZhgh1Slm5tbCa8SHY69X8veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734451908; c=relaxed/simple;
	bh=cixTwTjFlxgw7iWNXLVtLIDoeoYXcjsICtkQH0K/rJE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AbyOiPKtfYHUnENFXBYR+vc1HVd3Axv0ziWNGCVCL6KKQFq1p1Ti1pBD4J8RMuKd0nmAqaQqjAMz/EfIAauxfsSEXnSI8xU+ODiUZMGCI9svosv0DIfdzmN7q/Azz2xlIwI0PzXmviCj80ttCj7k1n6n4H00UsGmYeOnAq1j8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=khUfE+ie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="khUfE+ie"
Received: by smtp.kernel.org (Postfix)
	id 42A26C4CEDE; Tue, 17 Dec 2024 16:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC515C4CED3;
	Tue, 17 Dec 2024 16:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734451908;
	bh=cixTwTjFlxgw7iWNXLVtLIDoeoYXcjsICtkQH0K/rJE=;
	h=From:To:Subject:Date:From;
	b=khUfE+ie4X4LTjDMzWlsFcWvqC4dZ07c1NY1pYXeKyJeNxmLHJXybTmYUZrUvKTme
	 wCComJdLd6BHjAM/YfHpRd2mEK1NH60dpuQFH5bw2hU2oSv+0HEoOUHps7Sh9FKG5q
	 0KR2FLUvsnQ1OAvVQiHvsOR+q9WVkrNd3PxjNEa3U6Mo8ZzntUVsZfjtHqbpUB/muI
	 VAxk3obb4xb/rKkZzXx8VM4NJJN1Touo+r2TEDD6Frf0WwkIdbKEO52AC2YsHwOWjG
	 X9T7Og7Vc+rycNfSkyjwCc11Ig9Fo1q7JU1Z8u57+xCAdSs3p0Q74tKt4inrKsPx7c
	 icCnVt8ExBQmA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: tools@kernel.org
Subject: [PATCH] Ensure patches show moves rather than add/delete
Date: Tue, 17 Dec 2024 10:11:46 -0600
Message-ID: <20241217161146.1943425-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't rely of users' gitconfig when generating patches with a move. The
default now for gitconfig is this is enabled, but I'm pretty sure it used
to be disabled by default. In any case, users mess with long time defaults
like threading for no good reason.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Maybe we want -C and -B too? Those don't happen too often compared to moves.
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index bb93656d8ad7..a63520792df5 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3464,6 +3464,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             gitdir,
             [
                 'show',
+                '-M',
                 '--format=email',
                 '--full-index',
                 '--binary',
-- 
2.45.2

