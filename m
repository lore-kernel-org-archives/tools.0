Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3533A9E3
	for <tools@linux.kernel.org>; Wed, 17 Dec 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765993866; cv=none; b=YM6DQ/aGgQY/LMGRagrdoZXxi3ngrVo+ckbMba1d8Ybfia7ilOW7/SoBKlz+c/7p5ptxbv81TCG89GYBiWirGtTyl0JSYKV4DYLGxfutlUkobhZ74O2mJzjO8FUQ8d6mqKxOor8zq32SdwW3NW2wbKHmMj1lxouToL6+MOCOAvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765993866; c=relaxed/simple;
	bh=fK78Ly2j8w0wtiLzV93BU8OI7SuKo4gUzPshKTednI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azuveG/PAVl3TgKcUlbLFysts7k5Wnrm3hlzdpUM3MQx+t85jWaWSXuLFjFGZnJUqK9i5rd4JXB995/vwcMhp6wqxaU+k7Omk7YfBo/m/VuOMESI2lIH9Sjca6ctcVmp8yq7/spYc47qRV4fTPZ0EnKTVnhHo0YXtbACPjRSNXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b=bpaJaIZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bpaJaIZr"
Received: by smtp.kernel.org (Postfix)
	id 78253C4AF0B; Wed, 17 Dec 2025 17:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A1FC4CEF5;
	Wed, 17 Dec 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bpaJaIZr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1765993862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fK78Ly2j8w0wtiLzV93BU8OI7SuKo4gUzPshKTednI8=;
	b=bpaJaIZrK//N7HV8N1+KzPLDpwLADneGR1Y+9/knANuXXoXeE9yxNnLg4pYnmhFVenaFiU
	WHRIqfuzPbsvhObwbAUv3k8h9KN7aSaRfPcP5HRB0+fLjxIvjS1l+XX42tpKHECahY9D1J
	oAGjhbvVOqo0lPYkLGpkZUPQNK6RwsM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 512f5786 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 17 Dec 2025 17:51:02 +0000 (UTC)
Date: Wed, 17 Dec 2025 18:50:59 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org, users@kernel.org
Subject: Re: korgalore v0.2 released with JMAP, IMAP, Maildir support
Message-ID: <aULtg2SJVT7WAdvv@zx2c4.com>
References: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251217-attractive-stalwart-seahorse-de4e3e@lemur>

On Wed, Dec 17, 2025 at 10:21:27AM -0500, Konstantin Ryabitsev wrote:
> - Local maildir: for those who prefer local mail storage.

Wondering: is there a difference between this and using lei? Should I
switch my lei setup over to korgalore with a local maildir?

Jason
