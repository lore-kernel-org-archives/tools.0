Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C7B2248A0
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 22:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771973707; cv=none; b=Y2EYzI2A93oSCT581BSKslu8AKbJziK1oOfMU8KF7wESIzF0895ufnxLUheyH4TYgq/FHOvOGcO6sIpD9U7lZoMbN3G0aB7BuZVsgvZaog94jgNFfijeRUpgotTuC0x1CvNVceITOS4L3GBDF5DdbmRr4jvg07svnG6MYR5/HeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771973707; c=relaxed/simple;
	bh=b0MrLh1vrAep+e9um1gGxeRa7SM5T/28Oa8PBWZwdoY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=G8qkWmo339DkYreTjixVwcOoQvkDIhQG+J/CGQ8cYssykLJD+tj2//cT4o6g/I+NPme2TWz3VlEB+evacNURBvMqqjirWvXgQIKYeMdCuQ1X1LvQKefiM7IkuWP6UX2KGBVHY3HZ2JRuqj71wGmszoueqWjWs4a8LhCUss1FXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nCvzr9NO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nCvzr9NO"
Received: by smtp.kernel.org (Postfix)
	id C1ED2C19423; Tue, 24 Feb 2026 22:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DE6C116D0;
	Tue, 24 Feb 2026 22:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771973706;
	bh=b0MrLh1vrAep+e9um1gGxeRa7SM5T/28Oa8PBWZwdoY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=nCvzr9NOajNm8c8TdJzkIPcVWCmHJ7WPUIS/paoxFQtUhMntwmGPpTM+zWvSBu6oa
	 Njb2SS8i+r+ROQgMcFWfqGZYdDLUAsa//u6RpwTcufOk0jKM99pzLgvKU2RXJykQPo
	 4B46C3UTCp4uwQBGZMEoMEJj2Gc11T/T6pibhYq8=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH wotmate] export-keyring: Add option to update
 certificate header
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
In-Reply-To: <20260210082521.1789192-2-u.kleine-koenig@baylibre.com>
References: <20260210082521.1789192-2-u.kleine-koenig@baylibre.com>
Date: Tue, 24 Feb 2026 17:55:03 -0500
Message-Id: <177197370391.4096808.12228206025820310217@lemur>
X-Mailer: b4 0.15-dev-4ab14

On Tue, 10 Feb 2026 09:25:22 +0100, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> diff --git a/export-keyring.py b/export-keyring.py
> index 0208343..3aaba97 100755
> --- a/export-keyring.py
> +++ b/export-keyring.py
> @@ -120,6 +123,11 @@ if __name__ == '__main__':
>          keydata = wotmate.gpg_run_command(args, with_colons=False)
>          keyout = os.path.join(keydir, '%s.asc' % kid)
>  
> +        # Now, generate the header
> +        args = ['--list-options', 'show-notations', '--list-options',
> +                'no-show-uid-validity', '--with-subkey-fingerprints', '--list-key', kid]
> +        header = wotmate.gpg_run_command(args, with_colons=False)

Hmm...  This unconditionally adds a second gpg_run_command invocation per key.
Previously the header was only generated when key_changed was already True, so
the default code path had one GPG call per key; now it has two regardless of if
--update-header is set.

Am I reading this wrong?


-- 
KR

