Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D80D3612A
	for <tools@linux.kernel.org>; Thu,  8 Feb 2024 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423292; cv=none; b=DsminYF2g638RYMAe+xUSN/FvmPSrONMSrwtyKBW4KGLnJ9EiZqpVRIN7Um3UcfNyGYpzer7H9rbSMZ8mr7//zs6YQUHaNvY+F+AsHt0h3iV/kiVk9M9wjS/3ZmmWwgzb9gtL5s+NXhOt3BzX23buEbVwbEH4AtI1vV2Guj1iRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423292; c=relaxed/simple;
	bh=VEnL41b64G2n7CambGvc6Tbr2HFAsfCt9VU2DRPqotM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CcZtpQb/GBUD4SoXbu5BSGfM614Cc/g+7INjzpjcGj/QgqqEf+A8iCsKsJ2RHL6PgGf1xaMIVl/Y5wQ412rXjaSsNQAzAzc8gYnEArTc4ypD+lBGF1PRIthbLlvlDAGvX2/bzCKw8aZny0LzusamseugKiLLgijmvW+YgSmDstk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fJ8isoys; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fJ8isoys"
Received: by smtp.kernel.org (Postfix)
	id A42B0C433C7; Thu,  8 Feb 2024 20:14:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C810C433F1;
	Thu,  8 Feb 2024 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707423291;
	bh=VEnL41b64G2n7CambGvc6Tbr2HFAsfCt9VU2DRPqotM=;
	h=Date:From:To:Subject:From;
	b=fJ8isoysxU/ylfvUjhEsOguGEuJEvEg95IVOnO0zim3/ApsqAUgW8qIgdkiSzXvmS
	 gtKClIbb5EaYyfw2pTSQ9PocsQte5oeMXQUg0j75qLwu0DrW3VpD6F7NeGAwuvjwuh
	 fiY8iEfneAb8PZP32pRErS1oCvyNI2yW9A7DzXFA=
Date: Thu, 8 Feb 2024 15:14:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org
Subject: NB: 'b4 send --dry-run-to' is now 'b4 send --preview-to'
Message-ID: <20240208-sincere-mini-coyote-84e878@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

Based on some feedback [1] and on my own changing of opinion, I have renamed
the --dry-run-to option to be --preview-to. This helps keep --dry-run as
unambiguously "nothing will be changed or sent" option.

The documentation has also been updated.

-K

[1] https://github.com/mricon/b4/commit/4e03211130d5afbf26297bee8b549013fc30e6fc#r138312876
