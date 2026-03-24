Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCD346A1F
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337179; cv=none; b=VbFQSXwxrBKSAKkxrT4b8iljPvppMHfN1DFVpSaq5TnYo7RAE99yWV1mN1jzewpdAMqhsLe39Rv/TCHIXxFzcKXfXOOoRf/Qln+23g1+GPY4K5dg/Jt7/lAj19Br7wwA0VLzb74gHSoJlEJ38+k60rh7uEz9/FatZhy/MmXV5n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337179; c=relaxed/simple;
	bh=f5Q9Kf7LPoibBTuMat/+f/lAScrJHErxuq8TK/iHX3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=InPPq23Cr6jmfOYvcM0c2MZeSSyf3jPPDYCDyc93PLZ+gbLnyNVWfGzIJ4JGHWXjzh+RCVlwqa2JlLfATW7UfoDhr7SsoNnXiXmsAPAwa4OsF4t9EFzLJ92Cud9PmK4anIxVh2e0bQPohxtq904QLlhxKcji93Iy4uadPetY4tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzhFbh5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzhFbh5z"
Received: by smtp.kernel.org (Postfix)
	id 1706AC2BC9E; Tue, 24 Mar 2026 07:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD97C19424;
	Tue, 24 Mar 2026 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774337179;
	bh=f5Q9Kf7LPoibBTuMat/+f/lAScrJHErxuq8TK/iHX3E=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tzhFbh5zyMrBatFhf54xhDSM/UNAU71HB2Tjua3uMVtYT3fchFiG6cEy3C9aglj2I
	 uyH/+5UzU+NOjY2azyvWj4JtpFG2hSfaz8r6UNXIAhZ5VGl/QPrcnBZvWBmazjE1Q5
	 IuFzNROQyfpHp85DOg5b09dfb6eyIiMZZX9H39xWGDrvM9xkXcqyT1kXmrbhbR+5HM
	 8WhksIQKE/ebKwpE08qklMNGFSKrEqXLRrDqZVrAPZTO+UHCpdQZLnp8oyyqC20gWG
	 o62wDQOahOEXxRJ6pEYCaTjIxz9Nl8eL1ErZ5pmE/1miAuMJcikAYjfbFkENzBViFP
	 5726VOUNPZl+w==
Message-ID: <2c35a708-0ff6-4fe0-8974-2e786dadff6e@kernel.org>
Date: Tue, 24 Mar 2026 08:26:15 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4 v0.15.0 released
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
 tools@kernel.org
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20260320-portable-jaybird-of-focus-41fd66@lemur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20. 03. 26, 21:47, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> B4 v0.15.0 is now available! Install or upgrade using your usual mechanism.

Hi,

the TUI tests fail for me (while packaging for openSUSE):

> FAILED src/tests/test_tui_tracking.py::TestTrackingAppStartup::test_empty_database - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingAppStartup::test_series_listed - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingAppStartup::test_title_shows_identifier_and_count - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingAppStartup::test_series_sorted_by_added_at - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingNavigation::test_jk_navigation - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingNavigation::test_help_opens_and_closes - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingLimit::test_limit_filters_by_subject - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingLimit::test_limit_filters_by_sender - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingLimit::test_clear_limit - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingLimit::test_limit_title_shows_count - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingLimitPrefixes::test_limit_by_status - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingStatusGroups::test_actionable_before_non_actionable - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingStatusGroups::test_archived_not_shown - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingFocusChangeId::test_focus_on_specific_series - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingQuit::test_q_exits - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingActionMenu::test_action_menu_for_new_series - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingActionMenu::test_action_menu_for_snoozed - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingActionMenu::test_enter_on_new_opens_action_menu - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingUpgradeNewSeries::test_action_menu_shows_upgrade_for_new_with_newer - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingUpgradeNewSeries::test_action_menu_no_upgrade_without_newer - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingUpgradeNewSeries::test_upgrade_switches_revision - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingSnooze::test_snooze_new_series - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingSnooze::test_snooze_cancel - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingAbandon::test_abandon_new_series - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingAbandon::test_abandon_cancel - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingDetailPanel::test_detail_panel_shows_on_highlight - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingDetailPanel::test_detail_panel_hides_on_escape - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingDetailPanel::test_detail_panel_updates_on_navigation - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTrackingSnoozeRemembersChoice::test_snooze_remembers_last_input - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestSeriesLifecycle::test_new_directly_to_snoozed - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestSeriesLifecycle::test_gone_series_actions - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestTargetBranch::test_target_branch_in_details - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestUpdateRevisionWorkflow::test_prepared_none_is_noop - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestUpdateRevisionWorkflow::test_prepared_pushes_base_selection - RuntimeError: Not inside a git repository
> FAILED src/tests/test_tui_tracking.py::TestUpdateRevisionWorkflow::test_base_selected_none_cancels - RuntimeError: Not inside a git repository

I use the released .tar, so there is indeed no .git. Doing:

--- a/src/b4/ty.py        2026-03-24 07:24:14.713405924 +0100
+++ b/src/b4/ty.py       2026-03-24 08:19:47.936368274 +0100
@@ -682,7 +681,7 @@
      """
      gitdir = b4.git_get_common_dir()
      if not gitdir:
-        raise RuntimeError('Not inside a git repository')
+        gitdir = '.'
      qdir = os.path.join(gitdir, 'b4-review', 'queue')
      if dryrun:
          qdir = os.path.join(qdir, 'dryrun')


makes this work -- whether this is correct, I don't know.

Then, there is one more failure:

> ____________________________________________________ TestTrackingAbandon.test_abandon_new_series _____________________________________________________
> 
> self = <tests.test_tui_tracking.TestTrackingAbandon object at 0x7f2f1db36850>
> tmp_path = PosixPath('/tmp/pytest-of-abuild/pytest-18/test_abandon_new_series0')
> 
>     @pytest.mark.asyncio
>     async def test_abandon_new_series(self, tmp_path: pathlib.Path) -> None:
>         """Abandoning a new series should remove it from the DB."""
>         identifier = 'test-abandon'
>         _seed_db(identifier, [
>             {
>                 'change_id': 'keep-1',
>                 'subject': '[PATCH] keep me',
>                 'sent_at': '2026-03-10T11:00:00+00:00',
>                 'message_id': 'keep@ex.com',
>             },
>             {
>                 'change_id': 'abandon-1',
>                 'subject': '[PATCH] abandon me',
>                 'sent_at': '2026-03-10T12:00:00+00:00',
>                 'message_id': 'abandon@ex.com',
>             },
>         ])
>     
>         app = TrackingApp(identifier)
>         async with app.run_test(size=(120, 30)) as pilot:
>             await pilot.pause()
>             # First series is 'abandon-1' (last inserted, added_at desc)
>             assert app._selected_series is not None
>             assert app._selected_series['change_id'] == 'abandon-1'
>     
>             await pilot.press('a')
>             await pilot.pause()
>             assert isinstance(app.screen, ActionScreen)
>     
>             # Select 'abandon' from the menu
>             await pilot.press('A')  # shortcut for abandon
>             await pilot.pause()
>     
>             # Should show confirm dialog
>             assert isinstance(app.screen, ConfirmScreen)
>     
>             await pilot.press('y')
>             await pilot.pause()
>     
>             # Verify the abandoned series is gone from DB
>             conn = tracking.get_db(identifier)
>             cursor = conn.execute('SELECT change_id FROM series')
>             remaining = [row[0] for row in cursor.fetchall()]
>             conn.close()
>             assert 'keep-1' in remaining
>>           assert 'abandon-1' not in remaining
> E           AssertionError: assert 'abandon-1' not in ['abandon-1', 'keep-1']
> 
> src/tests/test_tui_tracking.py:1076: AssertionError
> ----------------------------------------------------------------- Captured log setup -----------------------------------------------------------------
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    asyncio:selector_events.py:64 Using selector: EpollSelector
> ----------------------------------------------------------------- Captured log call ------------------------------------------------------------------
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --git-common-dir
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse b4/review/abandon-1
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse b4/review/keep-1
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --git-common-dir
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse b4/review/abandon-1
> DEBUG    b4:__init__.py:3047 Running git --no-pager rev-parse --show-toplevel
> ============================================================== short test summary info ===============================================================
> FAILED src/tests/test_tui_tracking.py::TestTrackingAbandon::test_abandon_new_series - AssertionError: assert 'abandon-1' not in ['abandon-1', 'keep-1']

thanks,
-- 
js
suse labs
