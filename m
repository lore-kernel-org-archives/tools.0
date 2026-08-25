Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F722F7EF5
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 21:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787692030; cv=none; b=iyY9B2TMd8Skak0+WOgvC8ToTr/NFT80EO+5wLcgqtCzGqDwd26uN81PNFXPAeGnyPCxZ0fQfbygo8zIiVdHvjalKq8yO85gRIKoc+7ca5Ht4PPO1FVdl+pj7IBJphQ3PRVX6xLZo15rmGa/L0BsVrBFcMC95Q6qHGcXLB4A03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787692030; c=relaxed/simple;
	bh=n4yAYz+PbtRacImQwj38Ixyt7bV5TAY0vSM9M/GydVQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HWfFuxNhS5oecRkDU/3gdgT6T/H+xQjFkGF+nPlwdYbCPXOAn0fjKE72dzNSgB8pldKqFvM70o7MnclsPRNJw7Zir5kIeaVBjVJomKEnV15QMiFeqOn0Gg1PiQu+hCu+kzpOSnSVh9H9yD58PTMyptbXVpqVxJwQesTwhgVBPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EnIQXyqg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EnIQXyqg"
Received: by smtp.kernel.org (Postfix)
	id 5EB9D1F00A3A; Tue, 25 Aug 2026 21:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184A41F000E9;
	Tue, 25 Aug 2026 21:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787692029;
	bh=LWtEoeKKUxvfdLh0c1UtRbwnAcfVEKdJnwvVKra+o+I=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=EnIQXyqgl/c81exkx+tgsXrYkRFeSG6pmaZSRoJvBRKPY0zXVIzfYR50/nhnq2rxC
	 0YOCbTlWbsrIhFTQmfeCwlxSWk6qSSC54ijF8kHLGEJXSC2mFlcSpUJC3WxAyrhxdU
	 kp0Y64XicZJNuoxt0EOM/ufiA+5gh86LahqKx86s=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, Jason Gunthorpe <jgg@nvidia.com>
In-Reply-To: <0-v1-b7509406782b+2711e-emacs_background_jgg@nvidia.com>
References: <0-v1-b7509406782b+2711e-emacs_background_jgg@nvidia.com>
Subject: Re: [PATCH b4] review: emacs: add customizable line backgrounds
 for quoted vs own text
Message-Id: <178769202573.3594992.9474758490950433770.b4-ty@b4>
Date: Tue, 25 Aug 2026 21:07:05 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=369;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=illU8FjT7COL15gssegXMfiwJ4z6Ca+cz0k3v3IwxTE=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL6mH/rzthz5fgta/vP5fr/nu68vaHTYf2hHboZZ1c/P
 biOMflNYkcpC4MYF4OsmCJL2b7YTUGFDz3k0ntMYeawMoEMYeDiFICJqJxh+CtSen7Wd8UJZn/F
 D5XsOfrzm/Qyl12H3j/g5jxlk/tq0ZWvjAynFFeUP69fbzpfrbRkccZOn6ZT5Wcs1936H96zd81
 p1zZWAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 25 Aug 2026 15:07:50 -0300, Jason Gunthorpe wrote:
> review: emacs: add customizable line backgrounds for quoted vs own text

Applied, thanks!

[1/1] review: emacs: add customizable line backgrounds for quoted vs own text
      commit: 5ec49f317b88377b2d8c42f929f364d701514fc7

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

