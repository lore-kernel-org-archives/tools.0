Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E119176252
	for <tools@linux.kernel.org>; Tue, 10 Sep 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726000885; cv=none; b=qgHykYWK9J0ifeQfybln9Xpx4y2Eoz8C5u/laLt/ZA+MZWno56THfUkCejl7H5UXWl2evDA874tIZCh/FLvZSuLSjUu3U3E1ldL+IhQVoRuxvAxN8wFxGh9zU3fGcf3d+IRtEhCDRUTkPYcSewC6RUof27EB5ZpgRjyos1Bj+Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726000885; c=relaxed/simple;
	bh=KDdK9K58mvibmxFo5QBJn/g0FyHhttggnyKo5HXY7rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a21JjcpH7QAUJfWZ2tAXGiVgHQodlyS8l01oXSybAgdFhgVkjYLIG1LFiYy5I8eNBgEOV5I+VT/FW2+5oCBYdONS4cjxndhPnFEA3kZBScwwLokB9eOLLVnJGSanAPGLGZBDbuYv4sWkiwe1m01B1xqyfOtiSZYujQFz9NHfkWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M6xpp/ua; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M6xpp/ua"
Received: by smtp.kernel.org (Postfix)
	id EED26C4CECC; Tue, 10 Sep 2024 20:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F960C4CEC3;
	Tue, 10 Sep 2024 20:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726000883;
	bh=KDdK9K58mvibmxFo5QBJn/g0FyHhttggnyKo5HXY7rY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6xpp/uavLa+0gXxLR2I/kMJoambnwm7rq5JExXuCPNVgCKbEAUFiv/Perrb7CUs7
	 RLub3NgStbQGiRq2d1C5iVlyoT9ravlglv8KnP4tzkovrIafy5NvtbSlnTTd+lj7a2
	 vKia62mbvewMWWRzBYHzn8+rL3d9wco2L8KmB1sg=
Date: Tue, 10 Sep 2024 16:41:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH b4] send: Add mail header to identify reflect messages
Message-ID: <20240910-ubiquitous-onyx-hoatzin-3d4fba@lemur>
References: <20240910-reflect-header-v1-1-99d3b6eb0bcc@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910-reflect-header-v1-1-99d3b6eb0bcc@bootlin.com>

On Tue, Sep 10, 2024 at 09:52:46AM GMT, Louis Chauvet wrote:
> Series are often send with reflect before actual submission to check the
> To/Cc and the content. Those reflected series are difficult to identify as
> they are intended to be exaclty the same as the real mails.
> 
> To allows people to write filters for those reflect mails, add a
> b4-specific header X-B4-Reflect.

I think we should actually put REFLECT into the subject, same as we do with
preview. I know the messages are supposed to look exactly as if they're
actually sent to the lists, but we can put "except REFLECT in the subject".

That would be a lot easier to identify than a header for a quick visual "did I
send this series yet?"

-K
