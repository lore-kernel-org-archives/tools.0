Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B69C149DF1
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 04:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785473560; cv=none; b=qObzk0Em6+MZHaSHAAkOH0PYNSyy9GJCcVnxonpnqPbaWvqsAClTMYFxdFXp0sNpKGSvBZ6CMC7BJngZvH1DSL1Gv5EvDgWDfUoy5uQOYWBihQGPx7S3cKTJ9D81IKRVa+WVL1J+8Aa4zB8fg3gg9AZGnNq6rpssNU4QQhVLTVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785473560; c=relaxed/simple;
	bh=gu0Mc3C70OfR/129lXMFfE1e+/iPw9JMENkq2dCYC9s=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tAXst4s/GSchROWDGTG/zepoMVX/KGoulewOs2Sq2WGooyV8oiGJBADTWI+eZRHjm4PePF4/vky6tHhWh8uD2BLSedKBMEuGlWvnYl4rD9fHFF+W6VdVMUdUvdbC3Dl3U48fOviWfZA9SnbxV0QV62nenHCN+wNozX7krk5noog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HUU4K6Bv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUU4K6Bv"
Received: by smtp.kernel.org (Postfix)
	id D0E011F00A3A; Fri, 31 Jul 2026 04:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3CF1F000E9;
	Fri, 31 Jul 2026 04:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785473558;
	bh=585L6zcZerABUTetzXVSsrQdudNzppYVeDgs68eGrbY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=HUU4K6Bvr8AGmLcq85CJgs5QBKngbEDDeHTnvHyTXrX0OSfYvJiQhXLNYo2ttMjnO
	 +y1LmeMar3KzT9HVDo8G8AbIpsoFVsfQca0jAjo/AypKNcX9bVTMLOuSGtRF35sfG6
	 0uR9AjI6hvWPKRyZwStFO6C9/66bqsBGMVaUklGo=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
References: <20260729-work-b4-tui-scroll-preserve-v1-0-42be22445eaf@kernel.org>
Subject: Re: [PATCH b4 0/2] b4 tui: preserve the list viewport across
 rebuilds
Message-Id: <178547355380.3880964.7373833676384012174.b4-ty@b4>
Date: Fri, 31 Jul 2026 04:52:33 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=Ek5k0orZAjxNZf7Wqrx57HPAlN5sF3rzWqvkB+bz3aA=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJytESVrm3Ifcfqaf37scdGJvayxVcPMuXvi1CdbevPN
 eO1vO36jlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABP5t4+RYZP239yfWnI8r15J
 nOfVkDx2n2/6o+cSzMo7su3lc5oTehgZZt2Rf3R7cuTMrWtjOIO17rCtWt9n8mz2+myJbqln/id
 bWQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 29 Jul 2026 11:58:18 +0200, Christian Brauner wrote:
> b4 tui: preserve the list viewport across rebuilds
> 
> Updating a series with 'u' in the review tracking TUI made the list
> visibly jump towards the top of the screen while the cursor stayed on
> the updated entry.  The tracker-style lists rebuild their ListView
> wholesale on every refresh, so the scroll offset died with the
> replaced widget; restoring the cursor index alone only scrolls the
> minimum needed to make that row visible again, which pins the view to
> the top of the list or glues the cursor row to the bottom edge.
> 
> [...]

Applied, thanks!

[1/2] b4 tui: preserve list scroll position across ListView rebuilds
      commit: 072c6f32cadee39fc66761421bd42fcb689a70fe
[2/2] tests: cover scroll preservation across list rebuilds
      commit: 682920f6d1d34b1620f402d22fda7876d42a90d8

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

