Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F56129B8CE
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749746235; cv=none; b=WeoHCSDAlZHaTFvU16iElibPOnyD2gy6VMpN8dLnqnPUhcAYd6aOUoUMck4s8Yx+bUsnnLXWRX/eXNx/+a5uOa4kJU77iT59fv/BrzmMK4HgPljhzBHoTt9s05L0CzdxgqCkioGVuCagzQvB2/0URsqLtBHKzCqPDuoqKws2QxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749746235; c=relaxed/simple;
	bh=NLaSiBD2K9C/aJo8I33/amoJzRYj+Gu1OEXQkecwfkk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfAXIMNlhpKWx3L8AUa4oEqSd+bL0PFGVB0TP7TxtxyIG86H1f2U4Neln4qmBVTgazEf5x1N2Y3O6wgjKFCFFezoL8JNkrDumJ6EHcAtutg0gVZeos8Uz+0YyEmWBuErQ+qfUiSbt60+0UQQKcI2pZRihMgqzlWMvMocmBzZfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hezDfuO9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hezDfuO9"
Received: by smtp.kernel.org (Postfix)
	id A33B7C4CEEE; Thu, 12 Jun 2025 16:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701A7C4AF0B;
	Thu, 12 Jun 2025 16:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749746233;
	bh=NLaSiBD2K9C/aJo8I33/amoJzRYj+Gu1OEXQkecwfkk=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=hezDfuO9754vxvwgXcaLGtwlksp0Rz8Etm4Dx5iwBccXZmoKwOcepBDixpo8pOdBm
	 i6c1cF2O+EZ2WuL9ObTWaecCbapgG+rqXekCUkKm+6Ut4c90jJRZajv67iyjFxJS1N
	 b+TxEOnFSpyJEvXHYSMysKQy9GIyJ5jqo+f7gBW4=
Date: Thu, 12 Jun 2025 12:37:12 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH 0/4] Improve SSH signing failure message
Message-ID: <20250612-aloof-flat-ant-a41bd0@lemur>
References: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>


On Thu, 12 Jun 2025 12:25:00 -0400, Tamir Duberstein wrote:
> Please see individual patches.
> 
> 

Applied, thanks!

[1/4] Improve SSH signing failure message
      commit: 147da002a479a07322a3edd3f2ccd9c7b3b1947c
[2/4] Plug subprocess FD leak
      commit: e07ab2f5e726713aa570ec4f7ebea46a80cfcbed
[3/4] Avoid spuriously reading gitconfig
      commit: e9a3cb3883cb1f23e084808185cd2dc409a92f16
[4/4] Remove impossible assertions
      commit: f5993937661865264092682e6aefd8e693d15627

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>
