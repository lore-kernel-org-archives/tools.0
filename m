Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108D199FD0
	for <tools@linux.kernel.org>; Thu, 19 Sep 2024 11:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726745137; cv=none; b=nlD1qAbNBWgPSIPKoT2NdH2F7eqQJEDPhl1IN2FyQ4v2XlwNKS2v395g9ym0T3Tho1gbdXS8uIQYWS5bDJgK7gnallEkemnXCIrBIx3JeLQs/DyDf37nuCltlY+mGgYS9IVMWkO0f6JHGYEXmVRvHeNyOhfdti6ddrUhavcYyxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726745137; c=relaxed/simple;
	bh=U1aaSpUQhict2JyCY7JGGseIvY2JJslimDt0bP+skNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9nI58JVbWTLJUWowcNjlZRCPFzrvpZ7nSt4VpkalNOt4ikRk0cQVCb45XPD3q3a6Lupoim9NdugVln7E3ofRPl5igWj1UotjHxmv+1wMik+Xpc9P3mwj3Xsrumq8RZF8DtjOsHtWHPjPj3mZ0FAk4puxx4Qel50Bej1Zq5HutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Y1qMCMei; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Y1qMCMei"
Received: by smtp.kernel.org (Postfix)
	id 6929AC4CEC6; Thu, 19 Sep 2024 11:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A94C4CEC4;
	Thu, 19 Sep 2024 11:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726745137;
	bh=U1aaSpUQhict2JyCY7JGGseIvY2JJslimDt0bP+skNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1qMCMeiAdO2N0JBuT52UR/ZLfEnp8qfbxecGk18CSpDXVYxXNG55s/uH4Us6iRcS
	 qBOwl+WOOMFPjPM82BAY3VnUthdMimxjQ8ScwlfbhFESU1IXrJdIklJBCsjtJ4R8uH
	 UBtr4DC/0CoMM6gIBf2xfTE017tXb/N2FI1DCVMk=
Date: Thu, 19 Sep 2024 07:25:34 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4 v2] ez: verify default checkpatch.pl arguments
Message-ID: <20240919-idealistic-monkey-of-swiftness-dbdaaa@lemur>
References: <20240919-extend-checkpatch-v2-1-3557f177a942@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919-extend-checkpatch-v2-1-3557f177a942@linaro.org>

On Thu, Sep 19, 2024 at 09:42:45AM GMT, Manos Pitsidianakis wrote:
> -                ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile']
> +                ecode, help_out, err = b4._run_command([checkpatch, "-h"], stdin=None, rundir=topdir)
> +                help_out = help_out.decode(errors='replace').strip() if help_out else ""

You should do this after `if ecode == 0`, since that's the only situation in
which you use this output. We also don't need to strip() or do the if/else
check, because Popen.communicate() should always return bytes.

> +                if ecode == 0:
> +                    ppcmds = f'{checkpatch}'

No need to f-string a single variable here.

> +                    for arg in ["q", "-terse", "-no-summary", "-mailback", "-showfile"]:
> +                        if f"-{arg} " in help_out:
> +                            ppcmds += f" -{arg}"
> +                    ppcmds += " -"
> +                    ppcmds = [ppcmds]
> +                else:
> +                    ppcmds = [f'{checkpatch} -q --terse --no-summary --mailback --showfile -']

I suggest you do the following that is a bit more python-idiomatic:
    
    defargs = ['--quiet', '--terse', '--no-summary', '--mailback', '--showfile']
    if ecode == 0:
        help_out = help_out.decode(errors='ignore')
        for defarg in list(defargs):
            if f' {defarg} ' not in help_out:
                defargs.remove(defarg)

    ppcmds = [f'{checkpatch} ' + ' '.join(defargs) + ' -']

Thanks for your help!

-K
