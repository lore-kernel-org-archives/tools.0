Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8066E1C12
	for <tools@linux.kernel.org>; Mon, 17 Oct 2022 14:10:20 +0000 (UTC)
Received: from mail-auth.avm.de (unknown [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Mon, 17 Oct 2022 16:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1666015356; bh=tk8f3N6qLO1zB9HUFpCEeiH8T5g7PHIo+PQcsl2YvK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8ku7GAmfe2EaiuFX7YLMN/5+4lv5ItCPDpdsCurQVbYhaFx7CW3nAvI9cUeNO6Th
	 DFyp+W05+rGo6Nru6vpzXKeF4PjPgAXw4syP3KTqXAk3QeLO0nQNBY9eF0Jz+B3iFI
	 aJP64BQMIGK8dIogQBHwGgtFe4E4rZdLDtUCVVsc=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 4E4A580276;
	Mon, 17 Oct 2022 16:02:36 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 4040D181445; Mon, 17 Oct 2022 16:02:36 +0200 (CEST)
Date: Mon, 17 Oct 2022 16:02:36 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] mbox: Exit with error code if no messages were found
Message-ID: <Y01gfNMHorrzMkZq@buildd.core.avm.de>
References: <20220825064109.550092-1-n.schier@avm.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825064109.550092-1-n.schier@avm.de>
X-purgate-ID: 149429::1666015356-39780AFC-0B883D3C/0/0
X-purgate-type: clean
X-purgate-size: 867
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Thu, Aug 25, 2022 at 08:41:09AM +0200, Nicolas Schier wrote:
> When mbox.main() is unable to retrieve any messages, some kind of error
> happend (e.g. msgid has not been found).  Forward error state to the
> parent process by exiting with exit code 1, to allow proper
> handling.
> 
> Signed-off-by: Nicolas Schier <n.schier@avm.de>
> ---
>  b4/mbox.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/b4/mbox.py b/b4/mbox.py
> index 9a6ea9c..0d258da 100644
> --- a/b4/mbox.py
> +++ b/b4/mbox.py
> @@ -755,7 +755,7 @@ def main(cmdargs):
>  
>      msgid, msgs = get_msgs(cmdargs)
>      if not msgs:
> -        return
> +        sys.exit(1)
>  
>      if len(msgs) and cmdargs.checknewer:
>          msgs = get_extra_series(msgs, direction=1, useproject=cmdargs.useproject)
> -- 
> 2.37.2

ping.  Any feedback?
