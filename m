Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795575140;
	b=MQTA0FDCgdLULH0pQC2pI/E/KwWpOvRJ+UCpfxjMv1cwYxAD/cle5U6UzMOLTL8PtUc9
	 eutsWG8A01Ga5ZISkyR+Ud8RY/SA4GNoTDviCwxIxSoTHIBiTmvvVMG2et95Caan98x9U
	 MT/FUHMg8BqqIftCuUy248WqxzFepV8aqWrOh2O29fWSGQ2+k/+FRN7Wz/SYYVvzTqOBm
	 0Kkb65JYK+k+3nDlaE+US5lyz3S8pLHbDgMKG8SLfN95y4KsEsW2M5E0V1D57OPLJjrHI
	 EfsFuiTKys2C7BllS6GUjw8CGeHYoWkhKtwi75/AzLDzlkCEOtTdLuFNZSxZveEHC6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575140;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KYXuF0aXO9/fh4H9HxgtlHf4IW+GudVqUjRHCQuWv9U=;
	b=zeGqISo2YLG4JtelaDD3c6ACNMaZgpXLkL3XN+4DF0EicLPTJmGGOtGl8Pqjcd1PNuq6
	 tQ7MmdyhMsPw8L1ecE7crOpgqrfW17v8Nus+1892YY1Q8nVfQ8qZc/W2lCy4LQtE1DCBd
	 u82pd/SAAKesZ0z2JXJa6uQkZFQVzpNcQTVQu2ZizTqDLTGIUPryaEs0pNedsYJ+edJo4
	 IKiDWn8MJQvMeJ06swvKDYJ19eZNAFWZ7rWWZ+YLA579FOvJLKID/AgNh7o1wVr+FZWvf
	 78j1UgfDCxhN6WI/FT079QS5q9NgmQy+hE3Fqg5Rbp4cpwFUE80QhhGx6gGgKgGjSWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRD5ESzW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CFF606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 02:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRD5ESzW
Received: by smtp.kernel.org (Postfix)
	id D935A1F000D0; Wed, 25 Nov 2026 02:52:19 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.192
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795575139;
	b=2CcZAvyhYYdPe4MfUSctCvtKQz3Fclqg/U6RsgDuFzjONkCboCgQMVTrwQLZgSNj9rvd
	 yWKxXKcY8vbMV+7QVS8/G6fFaatl4KNKAlpBy2wkmJbel8dRzZJXNqaRw5Ynpu4Fq58RX
	 DDtyeB3PYMh6H3yx6OVDiNo6wclzLbJdCPcVfcd+fuUJwjGXthMOLYIxTBDXu6IvKBSj0
	 RK9HiInqvlWXo3s27a+hPWHuQLnOsAslM7ooHl9V81NilnUcPa7UIXCAJwitPr5fNZzqp
	 545hpkkMVfWhEF6R/FyiYfsKhxu8wTve0dkd7lCsmJ6LIhNwkeciB6RSSqtXxdOndjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795575139;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KYXuF0aXO9/fh4H9HxgtlHf4IW+GudVqUjRHCQuWv9U=;
	b=ePDDJNCQq557vkyTfVoLRmoz0RsY6EyymgVNukFmjcCBURjLzd+pw/EjgFg+7NF3jzYh
	 ZQIfc+dwdAHK85R6qBFvqVcWQDvCchY930RVVib7TkVeUcK8roQURQVOsBo8X3iTYZiLN
	 L13X9JoEHkxyulIooa2xxw/lm7KK2XTKhHjYdftvGbgvkuJ+IRdULxlM559V5j4qiGxH7
	 ZrSctQMwqqafnayBREgYWPWIQ0wQRiU0Ah+GRNv1kbvrRKCL7gTyrIEDEYzZkXxT7NUH8
	 H+3Se2LrY5Xwl4ShoDHQ0RaGDZV6aOI6BbCmweifyOLzoaRijyi+bispCKGKIDoAEnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRD5ESzW;
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.192
Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78A951F000C6
	for <tools@kernel.org>; Wed, 25 Nov 2026 02:52:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZRD5ESzW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 78A951F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=nIJwrf1fgrloiEv4sVgd2nXUXhlt4qJZMXPjyZ3pm5U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795575126; v=1; x=1796179926;
 b=ZRD5ESzWuPwFD3bAkqrCZY9pU6pDzc0HkoldbwPVxwLLuHlkeuuBLLDwZI5cPwt/Gm3a1ucS
 soDeB9K6n2x1vBdoK6LBtcbrrUsxuOrLpj2jXJ+QPcBSlNzEJ/UDNxENpPWXCbCaFPEjwzwfbPe
 Hq2l8CHSXa/pOZJtZwi28nR4=
X-Envelope-To: tools@kernel.org
Received: by mta11.migadu.com with ESMTPS id ca999212b9bc5235;
	Wed, 25 Nov 2026 02:52:06 +0000
X-Mizu-Trace-ID: ca999212b9bc5235
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 10:51:58 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: "Kernel.org Tools" <tools@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH b4] tests: pin scratch repos to master regardless of
 init.defaultBranch
Message-ID: <20261125025158.GB184281@Liu-laptop>
References: <20261020-test_base_commit-v1-1-083fa909c424@kylinos.cn>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-test_base_commit-v1-1-083fa909c424@kylinos.cn>

Hi Konstantin,

The same issue, I only sent to tools@kernel.org but forgot to cc you.
Sorry to bother you.

Thanks
Hangbin
On Tue, Oct 20, 2026 at 05:56:30PM +0800, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> _init_repo() ran a plain "git init", so the scratch repo's initial
> branch followed the developer's init.defaultBranch. On a machine
> configured with init.defaultBranch=main (increasingly the norm), the
> repos come up on main, and test_base_commit_in_remote_tree then fails
> at its "git checkout master".
> 
> Pins -b master on the local side so the suite passes regardless of the
> developer's default-branch configuration.
> 
> Assisted-by: LLM [analysis, codegen]
> Fixes: 4ee47be995f2 ("ty: verify queued-thanks commits by ref reachability, not HTTP status")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
>  src/tests/test_ty.py | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
> index 269ce021306f..2901f053f0f5 100644
> --- a/src/tests/test_ty.py
> +++ b/src/tests/test_ty.py
> @@ -401,7 +401,9 @@ def test_get_check_repo_config_override(monkeypatch: pytest.MonkeyPatch) -> None
>  
>  
>  def _init_repo(path: str) -> None:
> -    ecode, out = b4.git_run_command(None, ['init', path])
> +    # -b master: some tests check out "master" by name, and an
> +    # init.defaultBranch of 'main' would leave no such branch to find.
> +    ecode, out = b4.git_run_command(None, ['init', '-b', 'master', path])
>      assert ecode == 0, out
>      b4.git_set_config(path, 'user.name', 'Test')
>      b4.git_set_config(path, 'user.email', 'test@example.com')
> 
> ---
> base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
> change-id: 20261020-test_base_commit-d258e41c094a
> 
> Best regards,
> --  
> Hangbin Liu <liuhangbin@kylinos.cn>
> 
