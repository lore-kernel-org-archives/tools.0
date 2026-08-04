Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D75843D4FD
	for <tools@linux.kernel.org>; Tue,  4 Aug 2026 18:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785866678; cv=none; b=atvEof/iVUGIqo25oKjCEgBzN2r9soOipos3rlwvh4MFKNnria8Mpm3QNo6PhhBLhLu25kKAsDUsfRiSuCxMCQkxw2BY0l22IRTO2pXx1/SynB4vb/NTWQlKn0I1TWDFmcZZUb+uL6o9scDAqaPRSIqf9rTh4sbIUbDlLPlLTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785866678; c=relaxed/simple;
	bh=e5GYz+La5KHxQO+PRL1lUJDXEUMi5XjhKVF7anl5myQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=g7q3RsUNRW4Ls05sROWzloEnLskj/q2uRGrKhNaQ6aCBoRkGmRkQwYiIqs1lvsyIhqnwKHOiDWfq+odGw/GRqZay0PwYe0bF1KO4DGwRqkpOaQrp4QPHJzHUG+5qNFBJSxIAOI0ok4xfILxTMyUGxXN7f+M1OYeMylp6JrtzpPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TR0qvTFp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TR0qvTFp"
Received: by smtp.kernel.org (Postfix)
	id DF5681F000E9; Tue,  4 Aug 2026 18:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874251F00A3A;
	Tue,  4 Aug 2026 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785866676;
	bh=mAGxLKjOZbVdD5jJaa8HJowaEnsh0Vultxrovyh4Ymk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=TR0qvTFpvplvnEMzDuePdfB4j5FRuhm68w6dlONVZBJ3WR8/6NQk3gaeHaOQ+F+wk
	 xFnZJbEnyXH2tMftVC//ucRxFOYp54ERX50Y7YC7GOlWNXoOKryyxAkDl0GNi4f21g
	 2F8eF7RnbiC2YHep4FkKtzXIQdCFPH2HZHyuHwn8=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, Breno Leitao <leitao@debian.org>
Cc: kernel-team@meta.com
In-Reply-To: <20260804-cleanup-v2-1-8c8df5d66e8f@debian.org>
References: <20260804-cleanup-v2-1-8c8df5d66e8f@debian.org>
Subject: Re: [PATCH b4 v2] prep: add --cleanup-older-than option to clean
 up stale branches
Message-Id: <178586666863.477202.11203726898393614561.b4-ty@b4>
Date: Tue, 04 Aug 2026 18:04:28 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=352;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=feqY3d8xV4yO9iUmwESPzGMIGBH4Ze0MVHiHvmjuyHw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKKNDdcaCvfVLg2hHmGU/8dI47/3Sti/y6SO8j0Mzn0s
 Ik4V2NaRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgImwvGdk+NCYlfvs0hMN5sfW
 4aw/Dp+T5PPsyHic/n/WoouPr0vZhTP8lbzy+ClP5bKPn2crc/2dsaKnsK+QLfPDxr1BZgc9p0y
 J4AQA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 04 Aug 2026 05:24:58 -0700, Breno Leitao wrote:
> prep: add --cleanup-older-than option to clean up stale branches

Applied, thanks!

[1/1] prep: add --cleanup-older-than option to clean up stale branches
      commit: 69f3df3954f387b408bab999d36452cafcc5120d

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

