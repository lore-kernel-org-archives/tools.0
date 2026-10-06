Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109D3CA4AB
	for <tools@linux.kernel.org>; Tue,  6 Oct 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277022; cv=none; b=q0cJILagvv/iHJsMyfST9GVIQ+aisWNJcXmPS9CT1ShTZhIqxwQmMbrIoQgQTbEI3atcGYAu2mkH1a9yNx5Q8kw7wTezSKQtMbgtEeYlwlB1nwa4Gx99zZlhMiXskrsmW450VM8p0JdQW9m4hXazMkQYh/Ak0EfD54nwTFTppsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277022; c=relaxed/simple;
	bh=upoTTx02xyNxQORpD3PmxOucv4/TQfIIiM23ZUgN5tQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rGK29/kxLYpqTW8hmyRnz8DORP9VZXeg6ISjxcxYHyzqwmGOWiaixtkwI5CsulQVDNyoIh5ozt0wV2TgZ9j8d2hc7kmP3BawruT+FZsX/GPAkGz7V5O2w1lP5E37IhXZIm6jtj9ouL/o5MuVyK3t1/dvqWA5WCdMFzkvurICFJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nsW6VaVH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nsW6VaVH"
Received: by smtp.kernel.org (Postfix)
	id C61131F0089E; Tue,  6 Oct 2026 08:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E33B1F00893;
	Tue,  6 Oct 2026 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791277020;
	bh=6ulH/X+yOZ7BnfVHNqdt5zHUG7mSEI6PtDw2Su1dN54=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nsW6VaVHzq6JLuFVzV5CSH6gmuJpwOS9vEFjZZDpStWQHNX8NMPUz0W2K7CaTYcOz
	 6QOWzZeZjKOAljkKVIbbWr5wviEv+fxJvUvnx9VwVyKF7nH3KNtEOlvvNh+RYouehx
	 T4zckwEb4UTgkKzajzAjNGwC1l3eH9jBo4DlRBWc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 Markus Probst <markus.probst@posteo.de>
In-Reply-To: <20261005-fix-cover-recipient-parsing-v2-1-fe647a72374c@kernel.org>
References: <20261005-fix-cover-recipient-parsing-v2-1-fe647a72374c@kernel.org>
Subject: Re: [PATCH b4 v2] prep: preserve recipients above cover changelogs
Message-Id: <179127700004.2266728.11403832485952337943.b4-ty@b4>
Date: Tue, 06 Oct 2026 08:56:40 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=324;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=T9xnMpb785fU+2+irAEt5PVhmq4FoX2h4FMBvmzdClw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKObD9jrbvJK9X6odtdXh+7ZafiJ22Wbfh7eFV16mers
 HsTLmXO6ChlYRDjYpAVU2Qp2xe7KajwoYdceo8pzBxWJpAhDFycAjARCXmG/5kmTc/qZNZP+bF1
 o+f/781vTf0OOffOK9Ax6rnN3P3hnSUjw6Ndm8PXfJJzXc0bmHlutXj2taVpwjfmbHvlV9CwnDV
 Hnw8A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 05 Oct 2026 13:20:52 -0700, Tamir Duberstein wrote:
> prep: preserve recipients above cover changelogs

Applied, thanks!

[1/1] prep: preserve recipients above cover changelogs
      commit: 3d1b88fd2103fa8f84795a9fd97c0a2eacd4e395

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

