Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209D91DFDAA
	for <tools@linux.kernel.org>; Mon, 28 Oct 2024 17:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137285; cv=none; b=ey6SvOPLmGZXCzkeQu2igDRnLAPRVgH+hsOprp/9j19qj8/a9kl4dsYnrNRv9W+eNL1A517qWxwOzXY9LvygLslpFot2/KaScPcNo19Q12tK97h97I0/+f5sWHGiYv/wc48rkxAfcUMIN0hlZg3xvA5xQCsjmEZ9YzYSwbgfJC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137285; c=relaxed/simple;
	bh=IWbxz3VkOyRFPFA2hOUEWzfn7J/BEEQ6yAmbT2aBKKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMuHySSZWPVNgtZewZwp9DVJjYT0smyFAb/DtoNAGvoSdpCEzAn+QTYfsCihNj39mL4z2nRLOYJEk05ybChYpLaBtWSOdDas+p19YqWPHWKJpJ3Ni2ZXMndLzMnaU+XYVWqCZEc3D2I9eH7MUihEMSApN+laXwV2AUWvvXKwRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d8tNGhC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d8tNGhC/"
Received: by smtp.kernel.org (Postfix)
	id E9F52C4CEC7; Mon, 28 Oct 2024 17:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E0BC4CEC3;
	Mon, 28 Oct 2024 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730137284;
	bh=IWbxz3VkOyRFPFA2hOUEWzfn7J/BEEQ6yAmbT2aBKKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8tNGhC/sLxeC60ctdZ0mFMj4qrIgVcZ78rzkA6Z+5smN4FKURBGPu9sXLypag9xi
	 Tv2SiT6lUKQpDeriklrmG19BMCAYeGLQiLCUZ1NX8OSi6kj3PzsDCRTMoZFvYYitSS
	 H6gzfitif3mXcrM/fhpM3Ha1W3tdPioPBwtWthGc=
Date: Mon, 28 Oct 2024 13:41:21 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [BUG b4]: `send --resend` appends SSH signature block
Message-ID: <20241028-naughty-grumpy-kudu-8aa2d9@lemur>
References: <CAJ-ks9nbCtD3OEy=AoHGOr_C6Ai8TknQVHzKCsS5bthm2hw2eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ-ks9nbCtD3OEy=AoHGOr_C6Ai8TknQVHzKCsS5bthm2hw2eQ@mail.gmail.com>

On Sat, Oct 26, 2024 at 12:57:36PM -0400, Tamir Duberstein wrote:
> Hello,
> 
> I sent this patch[0] and later resent it[1]; the latter contains an
> SSH signature block while the former does not; the commit is indeed
> signed with an SSH key. The result looks quite broken:

Yes, we don't expect the tag to be signed, but we should deal with it
properly.

bugspray tag me
