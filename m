Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994171BD9FE;
	Wed, 30 Oct 2024 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730309801; cv=none; b=AB/p1Igq56w0moYza9n2yLy/5hxXZbzf0IRv1ozusOT6Tchv1vg30gqQz5QwEDKBRYGsLLYDL9ZYBzINLlUg/GLvxa9yh4nNSck60btNDn/L9CSoJw++NMISdbhWB9EnUK+5e1nZRB6FPPeDyJXymRTMfx26j1nY4u2Q2FRBMow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730309801; c=relaxed/simple;
	bh=RskGepEEGFiggqxKO2ZlMiyXBX/zZy9EohAAzBm54Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZIRzqa5Jdfu4oLkoMv2bp0bwoA5kST7P8tYTqLt9egSJtRfqdCweLONrQ0YXS9lXbC6rAnjm7z6tUol8vF6AeV1SinEkbGCpOKmrO7y3NvehyTKjz43tLb4uVpxFtdxMRVb4yfQMnqS+22SdpZMkaZojaUBovPrVw6W3nCLiMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nDQ35r3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nDQ35r3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB6BBC4CECE;
	Wed, 30 Oct 2024 17:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730309800;
	bh=RskGepEEGFiggqxKO2ZlMiyXBX/zZy9EohAAzBm54Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDQ35r3cYiRBqdf4Ck+8DaNvMpZo1NkRDttQL1RkK7eOliHIdZKNGihbIe5bQuiE+
	 myZwedWr0C+0fc8T+VlMVM1MSbzRQ1C/BYaKbqBloBvzV9OG6HaDCsP2YicEJ9pw5K
	 727dJQLvbszfbqXJ1FSO/CwMk8yjYP8cshbDD+1I=
Date: Wed, 30 Oct 2024 13:36:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: b4 feature request: run command before rewriting history
Message-ID: <20241030-perfect-hot-chipmunk-ffae87@lemur>
References: <87ttdkrylx.fsf@toke.dk>
 <87ttctc2vk.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ttctc2vk.fsf@toke.dk>

On Wed, Oct 30, 2024 at 11:16:15AM +0100, Toke Høiland-Jørgensen wrote:
> > Do you think this would be feasible to implement?
> 
> Hi Konstantin
> 
> Friendly ping on the above? :)

Yeah, I hope to be able to look into this in the near future. Unfortunately,
I've been dealing with less-than-pleasant tasks such as ddos attacks and
trolls over the past couple of weeks, but at least it's finally on the wane as
people move on.

-K
