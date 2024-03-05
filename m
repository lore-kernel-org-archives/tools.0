Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D47A86647
	for <tools@linux.kernel.org>; Tue,  5 Mar 2024 20:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709672037; cv=none; b=rEQxbFjC0qDdxoZ020ZLeTo9EqHzJtVMECQ7N4hAaRKGmQfnUOdp4HIypi5k/4qnF/XqtQCk6wFtFz0FGJdh6hsV2OdkMgyzca/19HUHQ4E50tGT1cBkEu+vbS4G/s//W0kBZRwb5bNxu2r4inZFceR5AnMa/MPbnJOMxQHymOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709672037; c=relaxed/simple;
	bh=H9y9NjDMmtAzYVvKCjcP5jw5li4h1/89i9EVLRnswzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/Egm8A0pLxGzSBxtpq9bK/acOeUyHfL+r7pyu5r04b8AVCE9hFtDwgbqqHp729X6n0ZjiKYSdPNMER6oTok9h1fjjj0ncZMkJYejdNsjG66h3A/Gym4b5HRqz3dRubjzcTLM6a2C8tx16uIkXabRKv4mrdDWBeSckmKTiKQVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GjKEAMp0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GjKEAMp0"
Received: by smtp.kernel.org (Postfix)
	id 20D7EC43390; Tue,  5 Mar 2024 20:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77FDC433F1;
	Tue,  5 Mar 2024 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709672037;
	bh=H9y9NjDMmtAzYVvKCjcP5jw5li4h1/89i9EVLRnswzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjKEAMp0eHkJ3D03b5pWP0dxSxLWZO4i7ViI9cQhukCRRT3MqH9GAKQnNT8y9wuwO
	 DUPeqhEETUxSpZ/I8xJCSIQ0q5b9UE241ZJIj80syng1lH9cE6M/RjaoQVVnMNobvW
	 4xkOxxBoPGdG6ThiHAo1sURZc01b9x8tonSWAJCg=
Date: Tue, 5 Mar 2024 15:53:55 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: emil.l.velikov@gmail.com
Cc: tools@kernel.org
Subject: Re: [PATCH b4 v2] b4: add shell completion via python-shtab
Message-ID: <20240305-obedient-centipede-of-finesse-a35a86@lemur>
References: <20240301-shell-completion-v2-1-741c88669859@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240301-shell-completion-v2-1-741c88669859@gmail.com>

On Fri, Mar 01, 2024 at 04:59:23PM +0000, Emil Velikov via B4 Relay wrote:
> For more details, see the website https://github.com/iterative/shtab

Thank you for pointing me in that direction. I think I'd rather use their CLI
integration, what do you think? E.g. we can have misc/tc-generate.sh with the
following contents:

    #!/usr/bin/env bash
    if [[ -z $1 ]]; then
        echo "Specify the shell type as parameter (bash, zsh, tcsh)"
        exit 1
    fi
    if which shtab >/dev/null 2>&1; then
        PYTHONPATH="src${PYTHONPATH:+:$PYTHONPATH}" \
            exec shtab --shell=$1 -u b4.command.setup_parser
    fi

I believe running ./misc/tc-generate.sh from the toplevel dir should
get us the exact same result as your patch below, no?

My preference would be to go this route, because it doesn't create a new
dependency on shtab but still lets packagers generate and ship the
tab-completion content.

-K
