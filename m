Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A04C81
	for <tools@linux.kernel.org>; Tue, 30 Sep 2025 20:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263883; cv=none; b=bbYBqCG9F8WTy8nUN6dk+HeAKb1Kxtu0Z/E3lCT2THHwY2bLLy7Rf2TpbTfh+qEtIApXWoFYJHE9cQvAdbPY05r++lW9UMc4kNZSslKsZylGrQW43p8JhZJU4YVD4q/qbZhHYzasl60Bod44G09hAYw7AXkG2hwtoqDy1/LJ+gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263883; c=relaxed/simple;
	bh=+Qmu8M9YRSWHvk/WSkSmRnbj7KoElQsTxxVyj9btdcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1DWMWI/uwp7DCOa8SPQejY8oyrd1gx/Texr9+H+OgL785kguZJbuSJXvZGSbJmjDswVJI+pDk0qy/OtC+03tNvz0R9wdBXYaFeYZoDoOs/zaZTgYKu7n9QmUT9c1l1TQOo4i46misEueQPvKh9OzKbov6sFlf5l7+fhey80RLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MF8m6OwF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MF8m6OwF"
Received: by smtp.kernel.org (Postfix)
	id 9F41EC116C6; Tue, 30 Sep 2025 20:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D17C4CEF0;
	Tue, 30 Sep 2025 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759263882;
	bh=+Qmu8M9YRSWHvk/WSkSmRnbj7KoElQsTxxVyj9btdcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF8m6OwFfEbiYHtYGOarqbS0+UUF5Bf0fuKuL+iMooW68ERgHSRMSCt6Jq0LqKv0s
	 TFm8cAm7/RScgrVCiCDhHUuc6pgPq6fzJHo6X/UkRAWV0WnW1DIsDJHTs43tJXDtAM
	 +a1l0x/i/8Df8Ilbzl9oXeF/r6kEe2O0Q9f1zTMk=
Date: Tue, 30 Sep 2025 16:24:41 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH v2] b4: support send-email aliases
Message-ID: <20250930-carmine-butterfly-of-atheism-219f12@lemur>
References: <20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-jk-email-alias-support-v2-1-b0339905964e@intel.com>

On Wed, Jul 09, 2025 at 03:22:29PM -0700, Jacob Keller wrote:
> git send-email has supported the --translate-aliases option since v2.47, as
> commit c038a6f1d748 ("send-email: teach git send-email option to translate
> aliases", 2024-08-17)

Thank you for sending this in and I'm sorry that I've been sitting on this for
so long. I have the following thoughts:

1. Does it make sense to only do this when we see an address specified without
   the domain part (foolist as opposed to foolist@foodomain.com)?
2. I don't think we need to make this configurable
3. We should be using the new git_check_minimal_version() to make sure the
   version of git supports this, and then just do it

What do you think??

-K
