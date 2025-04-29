Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF721B19D
	for <tools@linux.kernel.org>; Tue, 29 Apr 2025 15:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942103; cv=none; b=BPTMUbmIRaDwlW3oNKj6mWP7oCx9LogI8lS2s7FhbBb4+/M5DURoqBOTDvpeiZhK0QIF5CobwcfUa4OdQwoUiew3c0k5kUszLs0jqn5sCJwy6QRZSgKP868di35cX3kuFlGnsgID7PCTENNTmDT8wnehrgXv1WsFrz+BVEIQPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942103; c=relaxed/simple;
	bh=CajK9GgQ9igIPC9Z1z5LqhjJ00vSLdxDrX7fjO9bgTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNddnsGtcgHIRFGmJiJvq/wM9zlZAqu7kK17Cg9ngjgFFNfc6fEOe8B8bw+/LcA0MHGx5rgoILjWGRP6Qg2aKCas8A1pJj9q0faSGSCkW1ax+pOMM2y653HopUp4fo2YQbCPMAaf7s4ALb6i3Hf7rpWakkBtcmWhVC/elWCHTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FHFLo6AW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FHFLo6AW"
Received: by smtp.kernel.org (Postfix)
	id 96139C4CEEE; Tue, 29 Apr 2025 15:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D44BC4CEE9;
	Tue, 29 Apr 2025 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745942102;
	bh=CajK9GgQ9igIPC9Z1z5LqhjJ00vSLdxDrX7fjO9bgTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHFLo6AWLeDQs3tKxCEC+72c2ZQ+wGgsjs3rF6eNd+S7x1TkqgK1GfUfYP/DXAYNb
	 R/CdEyR9DzRjeLYFyCZqAao8Qse+CdVxIGZxWkwqMd5yZE8LRTQLidUs8gN+ELqkIy
	 1GslueyZZObyz6s0Hu1SKQWw6r12SGtxZQ86E61A=
Date: Tue, 29 Apr 2025 11:54:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: tools@kernel.org
Subject: Re: Is there an incantation of b4 to pick up a single patch +
 attestations
Message-ID: <20250429-opalescent-augmented-hyena-df78f0@lemur>
References: <c13db4aa-9130-4382-85c8-008efda3bd77@quicinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c13db4aa-9130-4382-85c8-008efda3bd77@quicinc.com>

On Tue, Apr 29, 2025 at 08:45:02AM -0700, Jeff Johnson wrote:
> I have two separate patchsets where I'm trying to grab a single patch.
> The patches I'm trying to grab are:
> 20250327051320.3253783-5-quic_ramess@quicinc.com
> 20250408184501.3715887-4-aloka.dixit@oss.qualcomm.com
> 
> I'm using:
> b4 am --single-message --add-my-sob --add-link --check --prep-3way --no-cover $message
> 
> For both of these this is retrieving the message but not the separate
> Reviewed-by attestations.
> 
> Is there an incantation that does both?

Looks to me like you're trying to cherry-pick? Don't use --single-message, but
pass -P4 to the first series and -P3 to the second.

-K
