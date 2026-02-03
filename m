Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF62226CF1
	for <tools@linux.kernel.org>; Tue,  3 Feb 2026 03:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770089483; cv=none; b=gvPSkPN+It7C4omlm7hHYnJBe32LfZpFm5b4L8mrgft16WCzNqXDCDpIClKTxAbsWLgKqLr1RY+bq/fx/IT6iCqxzBPQvBZxpSX/zQMBBer9JI3L1AJq6oGfqtjWrWsXuc51WaSVEGeBrfMmAEnCsR9jx+TfEEWCLAoQAgyfxyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770089483; c=relaxed/simple;
	bh=xf7aeN5Q8vmTpwPjc05alTG2itsPXen0jAcK5YpIkKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/bistEJf9E1slKGfimUxGjIbRaK8Fdr/XN0IxDR2CJEps3kVX//rdH4K4Kj7JSzkV2ARuGD9GZBGuRaxFG49fy0rVwso5W7NOny7czdpF2VePVjeoOfeu/dZJHQbNMUYcN35n/IvFvqxCwOycmf9r777koq+ItGXt+il2OQFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fM3pjeG2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fM3pjeG2"
Received: by smtp.kernel.org (Postfix)
	id 7C487C116D0; Tue,  3 Feb 2026 03:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4244EC19425;
	Tue,  3 Feb 2026 03:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770089483;
	bh=xf7aeN5Q8vmTpwPjc05alTG2itsPXen0jAcK5YpIkKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fM3pjeG2J/VdNah3c9i4oCvPsn16/nbHmeIQvSvi6I6fWt/DTmYhluzz0kJns31Nj
	 IorKN4o9ijyO6PTwLZRrnuR4ttjuTzIX5DnZfD7LC7B6Ssz++06RUAtEq+2K/98nxV
	 ZtocGdwGe3c1a1VVv+Z4Jz2zti0q5in4msEKNIOA=
Date: Mon, 2 Feb 2026 22:31:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 2/2] b4: add support for oauth2 SMTP authentication
Message-ID: <20260202-amorphous-certain-walrus-e2bdd5@lemur>
References: <20260129-smtp-oauth2-outlook-v1-0-e8c6d1b00c03@vaisala.com>
 <20260129-smtp-oauth2-outlook-v1-2-e8c6d1b00c03@vaisala.com>
 <176992425475.611611.11253371452032746350@lemur>
 <c06e3173-dbec-4e05-91d5-b087e3f69b22@vaisala.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c06e3173-dbec-4e05-91d5-b087e3f69b22@vaisala.com>

On Mon, Feb 02, 2026 at 06:49:09PM +0200, Tomas Melin wrote:
> > Any reason we're not making use of git_credential_fill() here? I'm not sure we
> > can expect correct return here, because credential helpers expect input on
> > stdin like:
> > 
> >   protocol=smtp
> >   host=<server>
> >   username=<user>
> > 
> > The existing git_credential_fill() function should already handle this
> > correctly, unless I'm mistaken or you have other reasons not to use it.
> 
> Adding to my previous reply, this integration aligns with
> https://git-scm.com/docs/gitcredentials and in particular
> https://git-scm.com/docs/gitcredentials#_custom_helpers
> 
> And in identical manner as git-send-email this uses external helpers
> like listed here https://git-scm.com/docs/git-send-email#_sending_patches
> 
> So I don't see that git_credential_fill would be a match for it.

Sounds good to me, thank you for doing the extra legwork. I will be happy to
review v2 once you send it in with the other fixes.

-K
