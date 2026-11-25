Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795585987;
	b=BsL5Dla2k9roin0kp6aiEhp9PgfpwWcEvEr4du0a1lFlMFeEovdF8VF16Pdu9PgV/0wH
	 TWJ/zyDFHJfeCA1ZsdVpJUC+OdIXLXOwKWeRwYWLv5EnwfK0eVRa3yoWKM8JhGgP2rbf4
	 dxZh2FqdLE1BSxuUzA3QoV2Stfxzq+o7FIN/oaWOxTBx06zE5BYTLXu1rr93PqzE5//dL
	 6rmUK79Rs5ejBClN39RPblz4apTv8yYOACDegc+kUlCCbIrd+z2kRKD24PW4mqhJD0ZzP
	 AXefXlIG5jm0t/HpFkUY1EwKGKJf/ifK1b6+fqzzyxys+KMt35jP/RKs1bbuzzBmXfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795585987;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=y0KtvY5P/6btVX3iXoJQuP9+iJ00qPUh7IFxpRoqdFI=;
	b=2jv3yxJYxyuzHJNZ6jlxTX7vSHdkljvHxLhNJENPQVb4LsjZo0RL3y58bsqQfb4/Alwz
	 Zg6xyip8E4hMplpUqxtP6lRu5oAioW9SobTdzS9Ha/5h4XTiEKK0wAbyOI0kvgczXQC/0
	 KauSMoGRmNsI/pwfc7SVzL1IBrdhYxejXenq6oKNxd7S6Xg5gzkjpVUheupbqoYLcyUdd
	 AQG8S9f5sxgO6klZjtt/UtIjFUkCAP1mXFjuU0qKhYHhdn6CNhOEWga2U+jEjGwnC1Ieb
	 54xmqJb7R2HAJv0CGIDElSXdX/L9C7X2njrhCbENSsJRsvWWQ1AMyagwSLAre3wc9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=setGkOgS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B38606A321
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 05:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=setGkOgS
Received: by smtp.kernel.org (Postfix)
	id 8A7171F000C0; Wed, 25 Nov 2026 05:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E521F000C4;
	Wed, 25 Nov 2026 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795585986;
	bh=y0KtvY5P/6btVX3iXoJQuP9+iJ00qPUh7IFxpRoqdFI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=setGkOgSDsICWRNkUZPCqKw5zPnI6/gzdf9+k4C9ErWpkCAdh4UckHjJhbU+T4+Tj
	 lMTIyZeEUNd/45sjJyMEZVTiviWmMbmWN2130T5TUg5qm9gcQ8g2INEEDwC+y9n4Vi
	 I5vLHMgO9+Gi+cNJjLadnJETYsvnK3um6UJvV0xo=
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] tests: pin scratch repos to master regardless of
 init.defaultBranch
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Hangbin Liu <liuhangbin@kylinos.cn>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261020-test_base_commit-v1-1-083fa909c424@kylinos.cn>
References: <20261020-test_base_commit-v1-1-083fa909c424@kylinos.cn>
Date: Wed, 25 Nov 2026 05:53:04 +0000
Message-Id: <179558598406.3954985.17125450594205341485.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=416;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=aWLkGnD/Vt37wiFPA0Yt82NrCglq79+HhzsKR3pPGrA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZyg9Inb9WGHL79J7TacmP7Fg/Hi/ZGC5iPu3e3X/hv
 MztXY8ZOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAEwk4T/D/9oFjJN2f2lb1c1f
 FlIvyrEseol4dcL2K5+TzfdJFd+KqWL4Z3G0amGOjlPwqpUF+gn8D1hkHvIbxO9fPH9RWOLnJXk
 8XAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> _init_repo() ran a plain "git init", so the scratch repo's initial
> branch followed the developer's init.defaultBranch. On a machine
> configured with init.defaultBranch=main (increasingly the norm), the
> repos come up on main, and test_base_commit_in_remote_tree then fails
> at its "git checkout master".

Thanks, applied with minor tweaks.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
