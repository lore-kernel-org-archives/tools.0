Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42063BE71
	for <tools@linux.kernel.org>; Tue, 25 Jun 2024 14:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719325240; cv=none; b=YVjOFMJ+QPdPfNUsywXs4plDtd6bf6qpYVIn5RoArhE6uAWxv7xpWW1l6Wb7czuRX5k2Pp6XET2wbN2yHZlb1NJsr3jc4DT+8eHtjHxxE/r6ej9+GtYRdvhivbv0bRlav7yuGljz6QWgswHp1O4WvUrT6cJE0t5aewYqWhpHnY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719325240; c=relaxed/simple;
	bh=jcEY0Voh8xZKAOMeQLqG/A7eYY3+nh1uB57zQtx3Isw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6LU/Jb1AadzUnfkrb4XlJNb6Tfpiv8XMGNcfI0ZiwM0dyYK1V1fKmGRNrsQqaTMld6EoGxwcPRJfU3uDtCpepBmLo54xLjNEoO+KQeDqT8uRhBwaCx7XdKZ6gDLd5dWHggsHAlEADgVN1Ul0VWIObWUZ34mcerMRZvIqOk4DA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2iurIiIi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2iurIiIi"
Received: by smtp.kernel.org (Postfix)
	id 24116C4AF07; Tue, 25 Jun 2024 14:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FB4C32781;
	Tue, 25 Jun 2024 14:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719325240;
	bh=jcEY0Voh8xZKAOMeQLqG/A7eYY3+nh1uB57zQtx3Isw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2iurIiIicmSlvffukHqDxjMYsls1NStWtXg0xwoWQjgFdVfOo9V2QBaONpyWxysl1
	 7PPgYGxUOGs4bUFh5Z0MYtyrROnymubNF001VTCaT8kiye5pQZH8JUzHZIPCL8giTp
	 PSCMUA4Nzp6ucDvCwMHQ2Pj+2n2DbK5tlWqtHqmM=
Date: Tue, 25 Jun 2024 10:20:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: tools@kernel.org
Subject: Re: b4 prep confused by rebase from linus/master to
 linux-next/master?
Message-ID: <20240625-sepia-tarantula-of-diversity-adee66@lemur>
References: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fd4e083f-fd5b-490c-b0c6-4cae0acc6214@quicinc.com>

On Mon, Jun 24, 2024 at 03:42:02PM GMT, Jeff Johnson wrote:
> I have a b4-managed branch that was originally based upon linus/master.
> However that patch had a conflict with linux-next/master, so I rebased my b4
> branch to linux-next/master and resolved the conflicts. But that seems to have
> confused b4 since I don't get the expected results from:
> [jjohnson:development 8934] b4 prep --check
> [jjohnson:development 8935] b4 prep -c
> Will collect To: addresses using get_maintainer.pl
> Will collect Cc: addresses using get_maintainer.pl
> [jjohnson:development 8936] b4 send --no-sign --reflect
> [jjohnson:development 8937] b4 --version
> 0.14.0

Can you paste "b4 prep --show-info" for that branch?

-K
