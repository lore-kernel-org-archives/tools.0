Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B14AF682
	for <tools@linux.kernel.org>; Tue, 15 Sep 2026 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487089; cv=none; b=lVW0l2scOlBS/7QMFHGTX085UMhWpTP/uW082Dexo+a3iIpLgDwQJ79F3lcHyEyDMekhacKntCSo9Aa85CDavJ57j+hGFZb/yDuNPvOeOMzFqFOmli++dLQ4azID+a0BEtJSGlwOrbYBbcYQALJeudo/Ax2pcuLVX6tg9QeOubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487089; c=relaxed/simple;
	bh=HOQJIzpaIx5qxiZ/Rcpq7dvXDBRJ8FWRPlTIvR24xvQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sa1yDuYhRtVYivHnayMjJu0mGFpZxZNwK08eVgqEIjdScsx6V6a7JxJfdqFXWOuKDXWf4Xvc2hpE3k9gX0WboXqv0EtLb6N1NnauXvnkCofRNgHggL+RGL4xPdyU8hidq4A20kifHT0JhWI+b6gbevfCaFoAR92cTSWvaB023K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HawXpn51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HawXpn51"
Received: by smtp.kernel.org (Postfix)
	id BF5A61F00898; Tue, 15 Sep 2026 15:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DC71F00893;
	Tue, 15 Sep 2026 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789487086;
	bh=tH3JtUaNP/HDdYilY2tmj6thmnvU7HMOTm5AbS4K/Zg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=HawXpn51a4zqhvt6gAdV91dtbyfIF6Z+i24nO/Z1RQLpclYD/INJ1qYfDmOjoNNYC
	 saG9C034ILHgc87ogo0il4ZzFPWm6dyS1lYpzx6zehVsbx9HnwB6PFOCISxwSYv5BL
	 zhlLjC/uN0ZT7yehxeRNAqybQPQwUzcEM/oZIC0o=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
In-Reply-To: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
References: <0-v2-de162fd5fc4a+2b7-trimming_jgg@nvidia.com>
Subject: Re: [PATCH b4 v2 0/4] Improve email quote trimming
Message-Id: <178948708311.2456.12034064638475907201.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:44:43 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=gLt/dX2c3sTUnLit9HoTLhfvOzFNCvkREwLRtzNTAbc=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJWpr/VtjodEfTDvvbZuY2cyRILnk/XLGX4xPlQI/Ty4
 S8S/9nzOkpZGMS4GGTFFFnK9sVuCip86CGX3mMKM4eVCWQIAxenAExE/B8jw6WLNss25KSvC122
 2I//A1dWr4Xv3Kqj+x4o2Jbxm15Nj2T4X8d1TvRu4v31QasKJgYst3bV2s53j0/m1yZOBwbnB7e
 9uQE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Mon, 07 Sep 2026 16:22:50 -0300, Jason Gunthorpe wrote:
> Improve email quote trimming
> 
> Patches to make the automatic trimming more versatile and work in
> more cases.
> 
> I would, broadly, like to edit the messages without editing or removing
> any of the existing quoting. This is because I tend to make a few passes
> at things and once quoted text is deleted it is a huge PITA to bring it
> back.
> 
> [...]

Applied, thanks!

[1/4] review: trim trailing quoted when adding a tag
      commit: e00132591ea197066d91ba5c544d13b74e130131
[2/4] review: discard blank lines between | and > quotes when trimming
      commit: edc429c7b94a0c2f8df29cfcc00cf098d1761e55
[3/4] review: add >--cut-- inline marker to snip quoted reply context
      commit: 2a08c80c79db82a195ec88481a2ca9ff93f1e810
[4/4] review: emacs: highlighting and keystroke for >--cut--
      commit: 3386befc548a13bbe4b743b7d831267f5569cfd4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

