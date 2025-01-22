Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C69816BE3A
	for <tools@linux.kernel.org>; Wed, 22 Jan 2025 15:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560151; cv=none; b=eK+3tUEuE2x0BJEwYprjKC3+dexazY8SE7jHd2/L0mSOkvIUCmnbNe5EEG25/37sxjH/SwZdUoGyTVQb1oRMLEFOeY/DW04ImHpwHfuL3L/MtTgmei2gI9m+FsMCSxKSTHyt5N01W634kXhrd6plOfG0bJuWGzI8r9m5xDEEhvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560151; c=relaxed/simple;
	bh=tpHNX2de6MErt0vOlBfHhcZ+9a7sCOcOJFLyS/kfO4c=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iz41Y+M0ayC9UkGY+9LdXzKLR5yukOwQulAig97wfWdCfhDRi3WV9UM2nIWN3RLfOCSOysYEUWqwAD+tO0AkDC0iym5COma5FS8qLe0wAoEcnzgiOO4J4JgI9fszvUu5L4lsxW/4Fyxx3NEX+hQkVAe6BztWYv0e5fzZ9QuJ0qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Vrej6N5J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vrej6N5J"
Received: by smtp.kernel.org (Postfix)
	id 2DDF2C4CEE2; Wed, 22 Jan 2025 15:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0837C4CED3;
	Wed, 22 Jan 2025 15:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737560151;
	bh=tpHNX2de6MErt0vOlBfHhcZ+9a7sCOcOJFLyS/kfO4c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Vrej6N5JAcTlS1yRo3padjUVvsFqM71r5C4eDtmwBn2f5/0eV1c1TR812BiblQZb4
	 DqvSTtKBc0Wa9CqMPIFYJ/Qp9qGX3YdW3NPmVRGXmUYtW/rBcFya+doUWiFy0MJx9x
	 IW9qJBZT9uurJSvFeYQG5FXgB53rqumgjcUmL2AQ=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Matt Johnston <matt@codeconstruct.com.au>
In-Reply-To: <20241019-pr-diff-prefix-v1-1-435e6c256e2f@codeconstruct.com.au>
References: <20241019-pr-diff-prefix-v1-1-435e6c256e2f@codeconstruct.com.au>
Subject: Re: [PATCH b4] Create patches with --default-prefix
Message-Id: <173756015070.461601.15405866807346674290.b4-ty@linuxfoundation.org>
Date: Wed, 22 Jan 2025 10:35:50 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-b10be


On Sat, 19 Oct 2024 11:44:47 +0800, Matt Johnston wrote:
> This matches the behaviour of `git format-patch` to ignore diff.noprefix
> config (added in git 2.41.0 [1]). Otherwise b4 generated patches will
> be missing the top level a/ b/ prefix when diff.noprefix config is set.
> 
> [1] https://github.com/git/git/commit/c169af8f7ab521cc47b59f104db78847e324a3cb
> 
> 
> [...]

Applied, thanks!

[1/1] Create patches with --default-prefix
      commit: 71916edb52594131affa0402f89722d33d8ab90f

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

