Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4161DFED
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725634139; cv=none; b=Yk6kESdnXVqpnPZ0cRLWk45MNu7qIqkfElegF13edr0hp0gU1iqysVfAhA3xQRj5dYwYMljlSulzU6WvAOl8Tl2PXU1KnXilKTgv4tToKpFsfecRtoaQi+zPKf5+anMFAunZTT6kGdOouQFXnPVmFB0NNE7061phP+VBUG8uqfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725634139; c=relaxed/simple;
	bh=dGk6muQoLcZfYaPZdyzlyY/FSWZcZ8NR54nKQ+YwDC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGdY5BE958kKRtqN0YTX0gHQXLooGxEtAwuWYROa2Dh0wyV34LrxvMWJ69f3wV9FpsS08FPO/E0P+z8KNGJEcp8pJWcgq6PTGBontkC9mPNbd5CRpB84s0qilKpgHsxH9IXbGjCYIzUge63ZnGzLlhRs4/TzhJ2PV2aLmNQSq4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ymZ3t931; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ymZ3t931"
Received: by smtp.kernel.org (Postfix)
	id B8D10C4CEC6; Fri,  6 Sep 2024 14:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71AC3C4CEC4;
	Fri,  6 Sep 2024 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1725634138;
	bh=dGk6muQoLcZfYaPZdyzlyY/FSWZcZ8NR54nKQ+YwDC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ymZ3t931jzUNVzxFwRgzzLd1CettMRiJfmEwCLxKo5giGBOnsWAYN433WV4gqlq72
	 U0m4UcQbL6GXU+e+NX6nNqfUZTEPkYBulyyma5SLH8BUT2q1POeD5ua2stVZ+PoYfp
	 q+yh28hGo415GIs8BchyYje2pDfqLdWOvST8kays=
Date: Fri, 6 Sep 2024 10:48:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 0/3] Extend checkpatch.pl compatibilities
Message-ID: <20240906-beautiful-emerald-tuatara-c5f3cb@lemur>
References: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>

On Thu, Aug 15, 2024 at 04:36:26PM GMT, Manos Pitsidianakis wrote:
> This series fixes an error from reading prep-perpatch-check-cmd from
> .b4-config inappropriately, and also allows b4 to be more gentle for
> projects which use checkpatch.pl but are not the kernel.

Thank you for sending this in. There were other outstanding patches that
already addressed some of the issues you've fixed in this series. Could you
review and rebase as necessary?

Thanks!

-K
