Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668F2383BF
	for <tools@linux.kernel.org>; Tue, 13 Aug 2024 23:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723592725; cv=none; b=MiifJzy3huRMCKZu5nuxpSbME7LJci5TH497NUeis2Qn8oINawC5CUR7uxCrF0wF2qPR2jkbHcOCmlvccucrwDH4+A/vIZ/urtT7IxPyw+ytp0UOQfwnmAKsqfNpN++lLL1KMTmsX2dL7CdNGRGteG5IZ+MJuhqrsLB3jcXUS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723592725; c=relaxed/simple;
	bh=vFq7mt9tf8iPHmLmLb3tZD+/wrnDjToG3CUFH2h+GAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s4yHVgH2m2qvP32mpd7aFgTJ0qdU7vOJ960tKGLjT/ZDz85YmeDtwKnqAPeQl8Ljhpkr4HnCo+Ej7tXtzILG8lBPTATDyuunn4oD3YoB51/NUy7VpIz5EPyDMS/YsOx/AUxN1RLEONMUAmCopfrE+Wc2WyJyXcC2W4KT0nC66xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EdB6yfyg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EdB6yfyg"
Received: by smtp.kernel.org (Postfix)
	id 03AC8C4AF0E; Tue, 13 Aug 2024 23:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B69C32782;
	Tue, 13 Aug 2024 23:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723592724;
	bh=vFq7mt9tf8iPHmLmLb3tZD+/wrnDjToG3CUFH2h+GAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdB6yfyg0quje+eWjEHdVoOV19+mfVILwRlO59joQhb3l5Z2TG9D1STI4fBlpN5eP
	 bnNcLM/Roxieuh4V5ZA3dVYEtmdqSAsIwXeROll7PTjtKZdYEPJsY6p3XtYH7EANO6
	 7N96ixPFe2bnrCs7TrQfE+y7EXcbvXAlAUOtJvls=
Date: Tue, 13 Aug 2024 19:45:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Kevin Hilman <khilman@baylibre.com>
Cc: tools@kernel.org
Subject: Re: b4 send: how to selectively suppress Cc?
Message-ID: <20240813-tunneling-caped-piculet-e34d08@lemur>
References: <7hmslgni7x.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7hmslgni7x.fsf@baylibre.com>

On Tue, Aug 13, 2024 at 03:58:10PM GMT, Kevin Hilman wrote:
> How do I pursuade b4 send to selectively *not* send emails to some of
> the emails it finds in to/from/sob etc?

You should be able to accomplish this with b4.email-exclude:

    A list of addresses to always exclude from the message recipients. Expects a
    comma-separated list with shell-style globbing. E.g.:

    email-exclude = *@codeaurora.org, *@obsolete.example.com

Let me know if this doesn't work.

-K
