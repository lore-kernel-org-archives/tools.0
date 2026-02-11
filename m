Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED5D242D83
	for <tools@linux.kernel.org>; Wed, 11 Feb 2026 19:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770839349; cv=none; b=uH1581vPJYHWxh0l/ODaDMSaLqAcvyylc5YuIJ8f6oo8Yi7MFJHNY0m/CJdffYWlkUKZLT8NR062sp4s5Abp5NVEiNL/XQD3cESTbZkuQ6+33C5dGhBO0wwyuGTH/iq4haWxKSVD/YPJNKnN87VcxhL9awuaB3BFFVcyk+JztA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770839349; c=relaxed/simple;
	bh=UwDkfLEB2uUelJ+xwZ2rfHYeuw7aiG0ooLf/j9TMqsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIVEkikc31LnKXfiYx33w139fVVB+/XAjp+V0To2E/YvIMzKW60c+YyDHVCSQeOFc5HUM5RSxFu2mmO6J9Cl5RcF9sFzYs34ssL/ySvWwhIyaytJB4jL+7zjCK5kRcug/uCW8HSkMNN0GDg+nyv45HSZuZVvzkHkWN0bUXeoEfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsQuDKlA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsQuDKlA"
Received: by smtp.kernel.org (Postfix)
	id DB81FC2BC86; Wed, 11 Feb 2026 19:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6FBC4CEF7;
	Wed, 11 Feb 2026 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770839348;
	bh=UwDkfLEB2uUelJ+xwZ2rfHYeuw7aiG0ooLf/j9TMqsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZsQuDKlAtU9gNIUWciug65Ns3MdEUr9qRQWAVdh2yDAEC5XBpoC1l5LUP35xbu+YU
	 a+NSwpVEkBc7C8u2lgAlK5ebPxxqO1Gk/BQYT2gYcJv7qe50MYFo3sbTe1FKhaOfDS
	 6pikUaO6AX9KWYu27Qcl4SA4KGg8dfK0ggLF8HTsjrziqPwK//u271bap9+dXNV4oq
	 JDwiBabxreUPxaKMrfY5dgYK17KmvI7dj4ySGV6GWhJnD9CwnCCiIlettQRmca/OLF
	 VjSKiJGbRE80jEwvtwSQC3KVs2+Mf5TwtKFCRmKdz5XQXKRSkOsv3DGfaTZQqTzDA8
	 H7emdCPWFMDAw==
Date: Wed, 11 Feb 2026 14:49:07 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: korgalore v0.5.2 now available
Message-ID: <20260211-enchanted-cicada-of-aurora-105bd9@lemur>
References: <20260211-courageous-ringtail-of-judgment-ae8c68@lemur>
 <20260211183509.GEaYzL3U2BhUIsAJ9b@fat_crate.local>
 <20260211-honest-unicorn-of-advertising-e0fe37@lemur>
 <9305e0e4-b6e6-4cb2-ad71-a929bf282565@app.fastmail.com>
 <20260211193320.GFaYzZgMJ2jHuYbHpl@fat_crate.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211193320.GFaYzZgMJ2jHuYbHpl@fat_crate.local>

On Wed, Feb 11, 2026 at 08:33:20PM +0100, Borislav Petkov wrote:
> Same thing:
> 
> $ pipx upgrade --force korgalore
> korgalore is already at latest version 0.5.dev0 (location: /home/boris/.local/share/pipx/venvs/korgalore)
> 
> v0.5.2 doesn't wanna come. :)

Bah, I hate it when tools think for me.

This will definitely do it. Probably.

    pipx install --force korgalore==0.5.2

I'm switching to uv.

-K
