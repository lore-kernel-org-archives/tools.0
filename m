Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A361299AB1
	for <tools@linux.kernel.org>; Wed, 25 Feb 2026 02:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771988084; cv=none; b=qaoEqTbXMRFoUS0aPpAWxXMPLv6FzBdy7rvWXgW9Ulw+3RVw76gIbcLNTDjEygHEfR65vMED/eAdxdc/YCwn/O0mROODUldRpX5JO4GaQCo2xUkzIwlOMdh0a02eKqoHcPrdExFNb44qhVxePO4oqxrhfnXA3sX5OFZqTi5x02g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771988084; c=relaxed/simple;
	bh=n/jDOAHVzoTJCL5QBlwTIgvbd7vyC5Alkc73AL+v8H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUrlcwNXAGMtw9pptzIdPzQgbOjcgwOCtxxnQ68k/bjYF8dipaZeTGSAoigv4RzVsODFacNTGoGNxVg04s/6G9akm1eW49hQUU6f8JyheNZm5lGpLmQtV9OfT9nV8u/NXoYJe8CAwnAlOdSvnmND/54+sGNBUWg6FkC38Hu5PGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=X9FhZtjs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="X9FhZtjs"
Received: by smtp.kernel.org (Postfix)
	id EF91BC2BC86; Wed, 25 Feb 2026 02:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98D2C116D0;
	Wed, 25 Feb 2026 02:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771988083;
	bh=n/jDOAHVzoTJCL5QBlwTIgvbd7vyC5Alkc73AL+v8H8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9FhZtjsoDD7W3h+gdqBp+PHDai9lDCvu5pwZILmwJrnhyzimZz7b6t6trNO35hQn
	 izvqZiJxueN8X7H3/axjbQKAj5EjhZshJdws3mW1bUpy72HUwqGcx8jEuNYANk7YrZ
	 Iz9+kWxN3N4Wydepz3yLSAK8hpuef0sMXutgrpzE=
Date: Tue, 24 Feb 2026 21:54:42 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] b4: Add option to b4-send to include git-notes
Message-ID: <20260224-malachite-mule-from-pluto-cfa9c4@lemur>
References: <20260224-add-git-notes-v1-1-9b7d3ab24b61@intel.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260224-add-git-notes-v1-1-9b7d3ab24b61@intel.com>

On Tue, Feb 24, 2026 at 06:01:49PM -0700, Vishal Verma wrote:
> Add an option (and a config entry) for b4-send to include any git-notes
> in the formatted patch after the '---' break.

This has come up multiple times, but unfortunately there is still no proper
support for git notes with git-filter-repo, so your notes will be lost
after a lot of very common b4 prep commands. See:

https://lore.kernel.org/tools/20250130-rich-orangutan-from-eldorado-04f621@lemur/

-- 
KR
