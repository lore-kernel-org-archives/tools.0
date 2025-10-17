Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995961C27
	for <tools@linux.kernel.org>; Fri, 17 Oct 2025 00:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760659731; cv=none; b=lUpuLtUiT6f0CMZ3oQRjoyWXH4o+DRoDzx3EzbiNZLp2zpCLYG1hZMBju3CfBl4b/xTD8JiRSuxIzrv4G890y0uwU0M3+vZb+bsOL2gGs0fXPFe0VGR5L0kChqaK4ndpyKNhfEb9kwJti6Zfa20d7C3/nxXtbXnHRN52XW6BvBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760659731; c=relaxed/simple;
	bh=tiTZEvMggsv6mP478maQrWEvAFOgjUesY/FwFEIAbUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPJ0ZWIM5tZpMa+WD3BpuAzMSS2Zl7h8aZyittiYcKqaGj+DTmzbJ4zAhp1ZG1HMJesP42Jq5Xb2ZyyLjpnXgnJcXdc93EIvG2HxGJey8C6/8KsdeSMCsK/Keb4d+O4xkmwAW+046Qv8aWxjjnQagPEJ0h+Z0K//ilJ9RFUNGRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d22/NhD4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d22/NhD4"
Received: by smtp.kernel.org (Postfix)
	id 237DBC113D0; Fri, 17 Oct 2025 00:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0608C4CEF1;
	Fri, 17 Oct 2025 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760659731;
	bh=tiTZEvMggsv6mP478maQrWEvAFOgjUesY/FwFEIAbUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d22/NhD4QUYyuqMeKdrOvm3k7UagEDxS6ZW9M87ZTFhz/LTy/C71vIu7jaW0nwatr
	 hdL7torGykpMMkdppfv0uT0Ara75I2qJdeGjCOD+BmWpjNr+wqp77hKU4azGzs2jIu
	 CM1Y8jQfX30xGB4YElThcpyf3VBGMOLS4+PddZig=
Date: Thu, 16 Oct 2025 20:08:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: tools@kernel.org
Subject: Re: [PATCH 0/2] b4: sparse-checkout related fixes
Message-ID: <20251016-powerful-nebulous-marmot-caa99c@lemur>
References: <cover.1760393880.git.mst@redhat.com>
 <20251015170619-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251015170619-mutt-send-email-mst@kernel.org>

On Wed, Oct 15, 2025 at 05:07:07PM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 13, 2025 at 06:20:06PM -0400, Michael S. Tsirkin wrote:
> > I encountered shazam test failures, diagnozing them I realized
> > b4 misuses the sparse-checkout command.
> > This patchset cleans this up.
> > Pls review, thanks!
> 
> Hi Konstantin,
> Just making sure sending this to tools@kernel.org is
> the right thing. And do you want to be CC'd? Thanks!

Nope, it's all good, I just haven't been able to review it yet.

-K
