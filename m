Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D634B137935
	for <tools@linux.kernel.org>; Wed,  6 Mar 2024 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709744952; cv=none; b=rU1c77nET9SNJpHh0oLqKRJLk0T9ajJNhH3oRBMAvWPLSi73uTgDNirN/lOtirPtV0NcLoCfcOHeyA6wViMBd+VV6ZAOyjWYDbdAVd4pjxC50KxBPrAJaNItptDoyqsIJSnAhYQu9n4JffB3bv2BWCZawjapZ9X8QnVYjmRq8E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709744952; c=relaxed/simple;
	bh=gBxqAhNN7u8tdn+hkn5ktjF0uKI72/+8nPgcELUP0c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebV2Fkv0X/fob7BNf5WuXBQplCH8vdhKlj5QvUIqR4FjPTlpASWsiEhuAJKo9rnptPMxlQEPOdIJbep2ize++z9NVVqOw6GIAF37oqzQm+/WeGumm9iKZlZbca6QTQsI7Sk8TZLokPfqpr3PiVsIE0ztiV9Pg9ORzEb5DUctBdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H8szk5ns; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H8szk5ns"
Received: by smtp.kernel.org (Postfix)
	id 8C9E4C43390; Wed,  6 Mar 2024 17:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54423C433F1;
	Wed,  6 Mar 2024 17:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709744951;
	bh=gBxqAhNN7u8tdn+hkn5ktjF0uKI72/+8nPgcELUP0c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8szk5ns+AUVWRl9+WRxtrdby2XnuonXo1tgee+iKKi8KmAHE+bSgulvYxEln7oin
	 DG0F5t/jH9xe8XUxdgQaY4cn9zpWidy7JRtXc+L77in9zy+MT9ID/kmeQf4J+2v8cx
	 50SX6Ch7Kxq1+4G2C8eGkq9lfsHBMbr1YOvFy/Vg=
Date: Wed, 6 Mar 2024 12:09:08 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 DKIM checks
Message-ID: <20240306-chirpy-dugong-of-enhancement-cfdfad@lemur>
References: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16beccd0-db0b-4c9c-a4d1-fcf43f98959c@citrix.com>

On Wed, Mar 06, 2024 at 05:04:51PM +0000, Andrew Cooper wrote:
> [Summary of an IRC debugging session, as requested]
> 
> b4 DKIM checks on my own patches fail.
> 
> It worked fine for Konstantin, and it turns out to be because of
> differing TXT record visibility inside and outside of the corporate notwork.

Right, one option we can consider is specifying an external DNS server to use
for DKIM lookups. I'll have to check if dkimpy supports this, though.

bugbot assign to me
