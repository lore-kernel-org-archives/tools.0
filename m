Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B3063561
	for <tools@linux.kernel.org>; Tue, 12 Dec 2023 19:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tFSjoPgd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B124C433C7;
	Tue, 12 Dec 2023 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1702410068;
	bh=qWhbTi47SizsEBS3lUqXAuNGRFKQm6KG8SB0BU/OeD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFSjoPgdwYfK4K79pdQYfzCBRH2tMRZfCVH3wqEDd+Hmj6e0/M0AqMZND3nxB+lYl
	 Y7yydWuOnF4uby9dYzBy/DSlq4mkZ/XsthyfdbB6pKXE91duAotmQ+qqWOpNuU0fLv
	 r+ih5KvNyjLTQ9G+uToyQ8TVvCdmThYojYAeoby0=
Date: Tue, 12 Dec 2023 14:41:07 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: tools@linux.kernel.org
Subject: Re: b4 send suggestion: handle .git_aliases
Message-ID: <20231212-illustrious-lion-of-psychology-d85d9d@meerkat>
References: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <34582e34-5b62-ab86-682d-dac555e90330@suse.cz>

On Tue, Dec 12, 2023 at 06:27:50PM +0100, Vlastimil Babka wrote:
> It would be nice if b4 send --to/cc used .git_aliases

I recall looking at that before, but it's non-trivial. There are 6 different
formats the aliases file can be in:

       sendemail.aliasesFile
           To avoid typing long email addresses, point this to one or more email aliases files. You must
           also supply sendemail.aliasFileType.

       sendemail.aliasFileType
           Format of the file(s) specified in sendemail.aliasesFile. Must be one of mutt, mailrc, pine,
           elm, gnus, or sendmail.

There is git-send-email --dump-aliases, but, unhelpfully, it will only dump
the shortnames, not the destinations.

I don't have a good solution in my head right now other than creating fake
patches, passing them to git-send-email with -to on the CLI and then parsing
what we get out of it. Which is horrible, but is about just as horrible as
creating a parser for 6 different file formats.

> and also if something malformed is given to it (such as an alias it doesn't
> handle now), warn instead of just dropping it silently.

That part at least I can handle properly.

-K
