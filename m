Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB801EE010
	for <tools@linux.kernel.org>; Thu, 10 Apr 2025 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318586; cv=none; b=lsAxmxLHGF9KDMomWPgRdsElKxf3YG2B0Ki5QJCQ8QIHgE16k4ejG1UmQZufz8xmTWjM+IibZepOh//Tp5WPy7whjFITfynf8B3yGfwL+qWSF2Ov3CvHX8Na5OgGusWa4GReYo0XRAKmnQvG+E5Iyxcsswe0pd50jN1Hg4BMKTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318586; c=relaxed/simple;
	bh=d7vEoUPG5u89IIAtPPbKy1yuy7VAPMmxViZf2p1CiYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uohaToB5rFMyq2uCULeiAnSLL1JzLskRNiLhjehyjaSbF4nfTMdrV6pm+P0C5dLvWEny3HQ9+hSeXelfIxkKGpqndXfvLvf7vpBcF47lwLaVdPB7LYW3FGCF9NbF4lfgJh69UEwiTIvzRzSqGDspczKr5nnAgdDpA6/1FQrGMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DS1Vt/+b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DS1Vt/+b"
Received: by smtp.kernel.org (Postfix)
	id B7AABC4CEE7; Thu, 10 Apr 2025 20:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81179C4CEDD;
	Thu, 10 Apr 2025 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744318585;
	bh=d7vEoUPG5u89IIAtPPbKy1yuy7VAPMmxViZf2p1CiYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DS1Vt/+bhrka3VRZb9RNgqHsQv6jthEgNOXbAGq6VCo0Ko+KJ9JngUkRqWZWNJkZf
	 KiP/d8UnZZk+5/Y8EBXrlLMXRd8iYy/UWb0wvkrmEectYVo3nTXVZTuUqDTUlKRsbh
	 Qgs4m2FGhbaMEYxCFitEyK7IXGg625PJPJM+Ijg0=
Date: Thu, 10 Apr 2025 16:56:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH wotmate v2] Write the text graph into a separate file in
 graphs/
Message-ID: <20250410-gabby-newt-of-pluck-dfeaab@lemur>
References: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410-trust-paths-improvements-v2-1-adfd17e41b3c@linuxfoundation.org>

On Thu, Apr 10, 2025 at 04:51:36PM -0400, Konstantin Ryabitsev wrote:
> Write the text graph representation of the trust relationships into a
> separate file in graphs/, with the following formatting changes:
> 
> - Show the depth of the signature
> - Don't use '.' to represent the target (I'm the one who suggested it,
>   but it doesn't make sense with these formatting changes)
> 
> Co-developed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

I actually suggest we squash these down into a single commit. 
Do you have any objections to that?

-K
